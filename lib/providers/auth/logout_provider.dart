import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/pages/auth/login/login_page.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class LogoutProvider extends ChangeNotifier {
  static LogoutProvider get(context) => Provider.of<LogoutProvider>(context);

  static LogoutProvider listenFalse(context) =>
      Provider.of<LogoutProvider>(context, listen: false);

  DataStatus? logoutStatus;

  setRememberMe(bool value) async {
    await LocalData.setBool(LocalKeys.isRememberMe, value);
  }

  Future<void> logout({bool loading = true}) async {
    notifyListeners();
    try {
      if (loading) {
        logoutStatus = DataStatus.loading;
        notifyListeners();
      }
      if (LocalData.userLoginData.token == null) {
        logoutStatus = DataStatus.successed;
        Future.delayed(Duration.zero, () async {
          AppRoutes.routeRemoveAllTo(
              NavigationService.currentContext, const LoginPage());
        });
      } else {
        var data = await RemoteData.getBodyRequest(AppStrings.logoutEndPoint,
            {"token": LocalData.userLoginData.token}, withLoading: true);
        if (data['error'] == false ||
            data['message'].toString().contains('Unauthenticated')) {
          showSnackbar(data['messages'] ?? 'User has been logged out');
          LocalData.remove(LocalKeys.userLoginData);
          LocalData.remove(LocalKeys.isRememberMe);
          logoutStatus = DataStatus.successed;
          Future.delayed(Duration.zero, () async {
            AppRoutes.routeRemoveAllTo(
                NavigationService.currentContext, const LoginPage());
          });
        } else {
          showSnackbar(data['message'].toString(), error: true);
          logoutStatus = DataStatus.failed;
        }
      }
    } catch (e) {
      log(e.toString());
      showSnackbar('User has been logged out');
      LocalData.remove(LocalKeys.userLoginData);
      LocalData.remove(LocalKeys.isRememberMe);
      logoutStatus = DataStatus.successed;
      Future.delayed(Duration.zero, () async {
        AppRoutes.routeRemoveAllTo(
            NavigationService.currentContext, const LoginPage());
      });
      // showSnackbar(e.toString(), error: true);
      logoutStatus = DataStatus.error;
    }
    notifyListeners();
  }
}
