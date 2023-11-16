import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/applied_jobs_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class AppliedJobsProvider extends ChangeNotifier {
  static AppliedJobsProvider get(context) =>
      Provider.of<AppliedJobsProvider>(context);

  static AppliedJobsProvider listenFalse(context) =>
      Provider.of<AppliedJobsProvider>(context, listen: false);

  DataStatus? appliedJobsStatus;
  AppliedJobs? appliedJobsModel;

  DataStatus? changeStatusStatus;

  Future<void> getAllAppliedJobs(
      {String? keyword, bool retry = false, bool withLoading = true}) async {
    try {
      appliedJobsStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          AppStrings.appliedJobsEndPoint +
              (keyword != null && keyword.isNotEmpty ? '?s=$keyword' : ''),
          withAuth: true,
          withLoading: withLoading);
      if (r['error'] == true) {
        appliedJobsStatus = DataStatus.error;
      } else {
        appliedJobsModel = AppliedJobs.fromJson(r['data']);
        appliedJobsStatus = DataStatus.successed;
      }
    } catch (e) {
      appliedJobsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  int? i;

  Future<void> changeStatus(int id, String status, {bool retry = false}) async {
    try {
      if (retry) {
        i = id;
        changeStatusStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          '${AppStrings.myAppliedStatusEndPoint}/$status/$id',
          withAuth: true);
      if (r['error'] == true) {
        changeStatusStatus = DataStatus.error;
      } else {
        changeStatusStatus = DataStatus.successed;
        getAllAppliedJobs();
      }
    } catch (e) {
      log(e.toString());
      showSnackbar('Change Status get Error!', error: true);
      changeStatusStatus = DataStatus.error;
      notifyListeners();
    }
    notifyListeners();
  }
}
