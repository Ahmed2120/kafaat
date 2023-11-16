import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/create_applications_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class AddNewApplicantProvider extends ChangeNotifier {
  static AddNewApplicantProvider get(context) =>
      Provider.of<AddNewApplicantProvider>(context);

  static AddNewApplicantProvider listenFalse(context) =>
      Provider.of<AddNewApplicantProvider>(context, listen: false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DataStatus? addNewApplicantStatus;

  // Var
  int? candidateId;
  int? jobId;
  String? content;
  String? status;

  Future<void> addNewApplicant(File cv, {bool retry = false}) async {
    int? cvId;
    try {
      var res = await RemoteData.uploadFile(
          cv, AppStrings.baseUrl + AppStrings.uploadCVEndPoint, 'cv_file',
          withLoading: true);
      cvId = jsonDecode(res.body)['data']['cv_id'];
      if (cvId == null) {
        showSnackbar('Applicant isn\'t added', error: true);
        return;
      }
    } catch (e) {
      showSnackbar('File Upload Faild!', error: true);
      return;
    }
    Map<String, dynamic> body = {
      'candidate_id': candidateId,
      'job_id': jobId,
      'content': content,
      'apply_cv_id': cvId,
      'status': status == null ? 'pending' : status!.toLowerCase(),
    };
    log(body.toString());
    try {
      if (retry) {
        addNewApplicantStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest(
          AppStrings.addNewApplicantEndPoint, body,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        showSnackbar('Applicant isn\'t added', error: true);
        addNewApplicantStatus = DataStatus.error;
      } else {
        showSnackbar('Applicant is added successfuly');
        addNewApplicantStatus = DataStatus.successed;
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
    } catch (e) {
      addNewApplicantStatus = DataStatus.error;
      showSnackbar('Applicant isn\'t added', error: true);
      log(e.toString());
    }
    notifyListeners();
  }

  //
  DataStatus? createApplicantDataStatus;
  CreateApplicantModel? createApplicantModel;

  Future<void> getAllData({bool retry = false}) async {
    try {
      createApplicantDataStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.createApplicantEndPoint,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        createApplicantDataStatus = DataStatus.error;
      } else {
        createApplicantModel = CreateApplicantModel.fromJson(r['data']);
        createApplicantDataStatus = DataStatus.successed;
      }
    } catch (e) {
      createApplicantDataStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
