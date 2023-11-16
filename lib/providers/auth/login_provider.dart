import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/user_login_model.dart';
import 'package:kafaat/providers/auth/profile_provider.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
export 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  static LoginProvider get(context) => Provider.of<LoginProvider>(context);

  static LoginProvider listenFalse(context) =>
      Provider.of<LoginProvider>(context, listen: false);

  DataStatus? loginStatus;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserLoginModel? userLoginData;
  bool rememberMe = false;

  Future<bool> get setRememberMe async {
    return await LocalData.setBool(LocalKeys.isRememberMe, rememberMe);
  }

  Future<void> login({bool loading = true}) async {
    try {
      String token = await FirebaseMessaging.instance.getToken() ?? '';
      Map<String, dynamic> body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "device_token": token,
      };
      if (loading) {
        loginStatus = DataStatus.loading;
        notifyListeners();
      }
      var data = await RemoteData.postRequest(AppStrings.loginEndPoint, body,
          withLoading: true);
      if (data['error'] == false) {
        LocalData.setString(LocalKeys.userLoginData, jsonEncode(data));
        userLoginData = UserLoginModel.fromMap(data);
        Future.delayed(Duration.zero, () async {
          setRememberMe;
          ProfileProvider.listenFalse(NavigationService.currentContext)
              .profile(withLoading: true)
              .then((status) {
            if (status == DataStatus.successed) {
              emailController.clear();
              passwordController.clear();
              loginStatus = DataStatus.successed;
              showSnackbar('User has been logged in');
              closeSnackbar(2).then((value) {
                Future.delayed(const Duration(milliseconds: 250), () async {
                  AppRoutes.routeRemoveAllTo(
                    NavigationService.currentContext,
                    userLoginData!.role!.isEmployer
                        ? const EmployerHomePage()
                        : const CandidateHomePage(),
                  );
                });
              });
            } else {
              showSnackbar('Login Error, Try Again!', error: true);
            }
          }).onError((error, stackTrace) {
            log(error.toString());
            showSnackbar(error.toString(), error: true);
          }).timeout(const Duration(seconds: 20));
        });
      } else {
        showSnackbar(
            (data['messages']['email'] ?? data['messages'] ?? data['message'])
                .toString(),
            error: true);
        loginStatus = DataStatus.failed;
      }
    } catch (e) {
      log(e.toString());
      showSnackbar(e.toString(), error: true);
      loginStatus = DataStatus.error;
    }
    notifyListeners();
  }
}
