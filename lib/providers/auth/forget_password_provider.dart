import 'dart:convert';
import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  static ForgetPasswordProvider get(context) => Provider.of<ForgetPasswordProvider>(context);

  static ForgetPasswordProvider listenFalse(context) =>
      Provider.of<ForgetPasswordProvider>(context, listen: false);

  DataStatus? forgetPasswordStatus;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // UserLoginModel? userLoginData;
  // bool rememberMe = false;

  // Future<bool> get setRememberMe async {
  //   return await LocalData.setBool(LocalKeys.isRememberMe, rememberMe);
  // }

  Future<void> checkEmail({bool loading = true}) async {
    notifyListeners();
    try {
      Map<String, dynamic> body = {
        "email": emailController.text.trim(),
      };
      if (loading) {
        forgetPasswordStatus = DataStatus.loading;
        notifyListeners();
      }
      var data = await RemoteData.postRequest(AppStrings.loginEndPoint, body);
      if (data['error'] == false) {
        showSnackbar('User has been logged in');
        LocalData.setString(LocalKeys.userLoginData, jsonEncode(data));
        // userLoginData = UserLoginModel.fromMap(data);
        forgetPasswordStatus = DataStatus.successed;
        // Future.delayed(Duration.zero, () async {
        //   setRememberMe;
        //   AppRoutes.routeRemoveAllTo(
        //     NavigationService.currentContext,
        //     userLoginData!.role!.isEmployer
        //         ? const EmployerHomePage()
        //         : const CandidateHomePage(),
        //   );
        // });
      } else {
        showSnackbar(data['message'].toString(), error: true);
        forgetPasswordStatus = DataStatus.failed;
      }
    } catch (e) {
      log(e.toString());
      showSnackbar(e.toString(), error: true);
      forgetPasswordStatus = DataStatus.error;
    }
    notifyListeners();
  }
}
