import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/dashboard_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class DashboardProvider extends ChangeNotifier {
  static DashboardProvider get(context) =>
      Provider.of<DashboardProvider>(context);

  static DashboardProvider listenFalse(context) =>
      Provider.of<DashboardProvider>(context, listen: false);

  DataStatus? dashboardStatus;
  DataStatus? bannersStatus;
  DashboardModel? dashboardModel;
  BannersModel? bannersModel;

  Future<void> dashboard({bool retry = true}) async {
    try {
      if (retry) {
        dashboardStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.dashboardEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        dashboardStatus = DataStatus.error;
      } else {
        dashboardModel = DashboardModel.fromJson(r['data']);
        dashboardStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> banners({bool retry = false}) async {
    try {
      if (retry) {
        bannersStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.bannersEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        bannersStatus = DataStatus.error;
      } else {
        bannersModel = BannersModel.fromJson(r);
        bannersStatus = DataStatus.successed;
      }
    } catch (e) {
      bannersStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
