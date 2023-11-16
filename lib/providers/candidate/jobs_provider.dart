import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/category_jobs_model.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/models/job_details_model.dart';
import 'package:kafaat/models/jobs_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class JobsProvider extends ChangeNotifier {
  static JobsProvider get(context) => Provider.of<JobsProvider>(context);

  static JobsProvider listenFalse(context) =>
      Provider.of<JobsProvider>(context, listen: false);

  DataStatus? jobsStatus;
  DataStatus? jobDetailsStatus;
  DataStatus? jobsByCategoryStatus;
  DataStatus? applyJobStatus;

  JobModel? allJobsModel;
  JobModel? jobModelWith;
  bool isSearch = false;
  JobDetails? jobDetailsModel;
  CategoryJobs? categoryJobsModel;

  JobModel? get jobModel => isSearch ? jobModelWith : allJobsModel;

  JobFilters? jobFilters;

  Future<void> jobs({bool retry = false}) async {
    try {
      if (retry) {
        jobsStatus = DataStatus.loading;
        notifyListeners();
      }
      if (jobFilters != null) {
        isSearch = true;
      } else {
        isSearch = false;
      }
      notifyListeners();
      var r = await RemoteData.getRequest(
          AppStrings.jobEndPoint +
              (jobFilters != null ? jobFilters!.toStr() : ''),
          withAuth: true);
      if (r['error'] == true) {
        jobsStatus = DataStatus.error;
      } else {
        if (jobFilters != null) {
          jobModelWith = JobModel.fromJson(r['data']);
        } else {
          allJobsModel = JobModel.fromJson(r['data']);
        }
        jobsStatus = DataStatus.successed;
      }
    } catch (e) {
      jobsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> jobsByCategory(
      {bool retry = false, required int categoryId}) async {
    try {
      if (retry) {
        jobsByCategoryStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          '${AppStrings.categoryEndPoint}/$categoryId',
          withAuth: true,
          withLoading: true);

      if (r['error'] == true) {
        jobsByCategoryStatus = DataStatus.error;
      } else {
        categoryJobsModel = CategoryJobs.fromJson(r['data']);
        jobsByCategoryStatus = DataStatus.successed;
      }
    } catch (e, s) {
      log(e.toString());
      jobsByCategoryStatus = DataStatus.error;
      print(e);
      print(s);
    }
    notifyListeners();
  }

  Future<void> jobDetails({bool retry = false, required String slugId}) async {
    try {
      if (retry) {
        jobDetailsStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest('${AppStrings.jobEndPoint}/$slugId',
          withAuth: true, withLoading: true);

      if (r['error'] == true) {
        jobDetailsStatus = DataStatus.error;
      } else {
        jobDetailsModel = JobDetails.fromJson(r['data']);
        jobDetailsStatus = DataStatus.successed;
      }
    } catch (e) {
      jobDetailsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> applyJob(File cvFile, String message, int jobId, int companyId,
      {bool retry = false}) async {
    try {
      if (retry) {
        applyJobStatus = DataStatus.loading;
        notifyListeners();
      }
      final response = await RemoteData.applyJob(
          cvFile, message, jobId, companyId,
          withLoading: true);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['error'] == false) {
        showSnackbar((jsonDecode(response.body)['messages'] ??
                jsonDecode(response.body)['message'])
            .toString());
        applyJobStatus = DataStatus.successed;
      } else {
        if (response.body
            .contains('The mail server could not deliver mail to')) {
          showSnackbar('The mail server could not deliver mail to this Account',
              error: true);
        } else {
          showSnackbar(
              (jsonDecode(response.body)['messages'] ??
                      jsonDecode(response.body)['message'] ??
                      'CV Upload is Faild, Try Again!')
                  .toString(),
              error: true);
        }
        applyJobStatus = DataStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
