import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/applications_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class ApplicationProvider extends ChangeNotifier {
  static ApplicationProvider get(context) =>
      Provider.of<ApplicationProvider>(context);

  static ApplicationProvider listenFalse(context) =>
      Provider.of<ApplicationProvider>(context, listen: false);

  DataStatus? applicationStatus;
  ApplicationModel? applicationModel;

  DataStatus? changeStatusStatus;

  Future<void> getAllApplication({bool retry = false}) async {
    try {
      applicationStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.applicationEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        applicationStatus = DataStatus.error;
      } else {
        applicationModel = ApplicationModel.fromJson(r['data']);
        applicationStatus = DataStatus.successed;
      }
    } catch (e) {
      applicationStatus = DataStatus.error;
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
          '${AppStrings.applicationEndPoint}/$status/$id',
          withAuth: true);
      if (r['error'] == true) {
        changeStatusStatus = DataStatus.error;
      } else {
        changeStatusStatus = DataStatus.successed;
        getAllApplication();
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
