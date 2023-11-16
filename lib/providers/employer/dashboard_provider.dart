// import 'dart:developer';

// import 'package:kafaat/core/core_exports.dart';
// import 'package:kafaat/models/dashboard_model.dart';
// import 'package:provider/provider.dart';
// export 'package:provider/provider.dart';

// class DashboardProvider extends ChangeNotifier {
//   static DashboardProvider get(context) =>
//       Provider.of<DashboardProvider>(context);

//   static DashboardProvider listenFalse(context) =>
//       Provider.of<DashboardProvider>(context, listen: false);

//   DataStatus? dashboardStatus;
//   DashboardModel? dashboardModel;

//   Future<void> dashboard({bool retry = true}) async {
//     try {
//       if (retry) {
//         dashboardStatus = DataStatus.loading;
//         notifyListeners();
//       }
//       var r = await RemoteData.getRequest(AppStrings.dashboardEndPoint,
//           withAuth: true);
//       if (r['error'] == true) {
//         dashboardStatus = DataStatus.error;
//       } else {
//         dashboardModel = DashboardModel.fromJson(r['data']);
//         dashboardStatus = DataStatus.successed;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     notifyListeners();
//   }
// }
