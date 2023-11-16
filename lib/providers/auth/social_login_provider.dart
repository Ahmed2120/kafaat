import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:kafaat/view/widgets/social_webview.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/social_methods_model.dart';
import 'package:kafaat/models/user_login_model.dart';
import 'package:kafaat/providers/auth/profile_provider.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
export 'package:provider/provider.dart';

class SocialLoginProvider extends ChangeNotifier {
  static SocialLoginProvider get(context) =>
      Provider.of<SocialLoginProvider>(context);

  static SocialLoginProvider listenFalse(context) =>
      Provider.of<SocialLoginProvider>(context, listen: false);

  DataStatus? socialSigninStatus;
  DataStatus? socialMethodsStatus;

  UserLoginModel? userLoginData;
  SocialMethodsModel? socialMethodsModel;

  Future<bool> get setRememberMe async {
    return await LocalData.setBool(LocalKeys.isRememberMe, true);
  }

  Future<void> getSocialMethods({bool retry = false}) async {
    try {
      if (retry) {
        socialMethodsStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.socialMethodsEndPoint,
          withAuth: false);
      print(r);
      if (r.toString().contains('error') && r['error'] == false) {
        socialMethodsModel =
            SocialMethodsModel.fromJson(json.decode(jsonEncode(r)));
        socialMethodsStatus = DataStatus.successed;
        notifyListeners();
      } else {
        socialMethodsStatus = DataStatus.error;
      }
    } catch (e) {
      log(e.toString());
      socialMethodsStatus = DataStatus.error;
    }
    notifyListeners();
  }

  Future<void> socialSignin(
      {String provider = 'google', String? role, bool loading = true}) async {
    notifyListeners();
    try {
      if (loading) {
        socialSigninStatus = DataStatus.loading;
        notifyListeners();
      }
      String token = await FirebaseMessaging.instance.getToken() ?? '';
      String? id;
      String? name;
      String? email;
      if (provider == 'google') {
        // await authenticateWithGoogle();
        print(socialMethodsModel?.methods?.google?.clientId);
        print(role);
        final googleSignIn = GoogleSignIn(
          clientId: socialMethodsModel?.methods?.google?.clientId,
          // serverClientId: socialMethodsModel?.methods?.google?.clientId,
          scopes: [
            'email',
            'profile',
            'https://www.googleapis.com/auth/contacts.readonly'
          ],
        );
        final res = await googleSignIn.signIn();
        id = res?.id;
        name = res?.displayName;
        email = res?.email;
      } else if (provider == 'facebook') {
      } else if (provider == 'twitter') {
      } else if (provider == 'linkedin') {}
      if (id != null) {
        var data = await RemoteData.postRequest(
            'social-callback?provider=$provider&id=$id&name=$name&email=$email${role != null ? '&role=$role' : ''}&device_token=$token',
            {
              "device_token": token,
            },
            withLoading: true);
        print(data);
        if (data['error'] == false) {
          LocalData.setString(LocalKeys.userLoginData, jsonEncode(data));
          userLoginData = UserLoginModel.fromMap(data);
          Future.delayed(Duration.zero, () async {
            setRememberMe;
            ProfileProvider.listenFalse(NavigationService.currentContext)
                .profile(withLoading: true)
                .then((status) {
              if (status == DataStatus.successed) {
                socialSigninStatus = DataStatus.successed;
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
          socialSigninStatus = DataStatus.failed;
        }
      }
    } catch (e) {
      log(e.toString());
      print(e.toString());
      showSnackbar(e.toString(), error: true);
      socialSigninStatus = DataStatus.error;
    }
    notifyListeners();
  }
}

Future<String?> googleSignIn(identifier, secret) async {
  final googleSignIn = GoogleSignIn(
    clientId: identifier, //identifier,
    scopes: [
      'email',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly'
    ],
  );
  final res = await googleSignIn.signIn();
  return res?.id;
}

// 66:AB:BD:1F:38:58:B7:9B:78:3F:36:BC:66:AE:95:30:E5:BE:F0:BB:7F:AD:2B:B2:AE:5E:28:6E:FA:0C:7B:D7
// E7:5F:D4:C2:30:CA:2F:38:29:E8:2D:76:0E:D8:98:B2:36:9A:77:84
// F0:9A:98:24:2F:12:83:ED:91:5B:69:D3:01:0C:EB:D0:92:68:2F:7E
// 28:AB:30:62:B8:35:DE:91:D6:D7:FA:02:B3:12:53:24:C4:E9:76:30:88:A9:03:25:A9:CA:C0:CE:1A:DC:1E:A3
