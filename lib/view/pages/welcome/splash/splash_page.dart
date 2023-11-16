import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/profile_provider.dart';
import 'package:kafaat/view/pages/auth/login/login_page.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
import 'package:kafaat/view/pages/welcome/onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  checkUser() async {
    await ProfileProvider.listenFalse(context).profile().then((status) {
      if (status == DataStatus.successed) {
        AppRoutes.routeRemoveAllTo(
          NavigationService.currentContext,
          LocalData.userLoginData.role!.isEmployer
              ? const EmployerHomePage()
              : const CandidateHomePage(),
        );
      } else {
        AppRoutes.routeRemoveAllTo(context, const LoginPage());
      }
    }).onError((error, stackTrace) {
      log(error.toString());
      AppRoutes.routeRemoveAllTo(context, const LoginPage());
      return null;
    }).timeout(const Duration(seconds: 20));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (LocalData.isFirstOpenApp) {
        AppRoutes.routeRemoveAllTo(context, const OnboardingPage());
      } else {
        if (LocalData.userLoginData.token != null && LocalData.isRememberMe) {
          checkUser();
        } else {
          AppRoutes.routeRemoveAllTo(context, const LoginPage());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3041),
      body: Center(
        child: SizedBox(
          width: 150,
          child: Image.asset(getAsset('new-logo')),
        ),
      ),
    );
  }
}
