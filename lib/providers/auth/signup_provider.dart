import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/user_login_model.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class SignupProvider extends ChangeNotifier {
  static SignupProvider get(context) => Provider.of<SignupProvider>(context);

  static SignupProvider listenFalse(context) =>
      Provider.of<SignupProvider>(context, listen: false);

  DataStatus? signupStatus;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  UserLoginModel? userSignupData;
  bool rememberMe = true;

  Future<bool> get setRememberMe async {
    return await LocalData.setBool(LocalKeys.isRememberMe, rememberMe);
  }

  int current = 0;
  List<String> roleList = [
    'Candidate',
    'Employer',
  ];

  Future<void> signup({bool loading = true}) async {
    try {
      String token = await FirebaseMessaging.instance.getToken() ?? '';
      Map<String, dynamic> body = {
        'type': roleList[current].toLowerCase(),
        'first_name': firstNameController.text.trim(),
        'last_name': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'password_confirmation': confirmPasswordController.text,
        "device_token": token,
      };
      if (loading) {
        signupStatus = DataStatus.loading;
        notifyListeners();
      }
      var data = await RemoteData.postRequest(AppStrings.registerEndPoint, body,
          withLoading: true);
      if (data['error'] == false) {
        showSnackbar('User has been logged in');
        data.addAll({'role': roleList[current].toLowerCase()});
        LocalData.setString(LocalKeys.userLoginData, jsonEncode(data));
        userSignupData = UserLoginModel.fromMap(data);
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        signupStatus = DataStatus.successed;
        Future.delayed(Duration.zero, () async {
          setRememberMe;
          AppRoutes.routeRemoveAllTo(
            NavigationService.currentContext,
            userSignupData!.role!.isEmployer
                ? const EmployerHomePage()
                : const CandidateHomePage(),
          );
        });
      } else {
        showSnackbar(data['messages'].toString(), error: true);
        signupStatus = DataStatus.failed;
      }
    } catch (e) {
      log(e.toString());
      showSnackbar(e.toString(), error: true);
      signupStatus = DataStatus.error;
    }
    notifyListeners();
  }
}
