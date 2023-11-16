import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/login_provider.dart';
import 'package:kafaat/providers/auth/social_login_provider.dart';
import 'package:kafaat/view/pages/auth/forget_password/forget_password_page.dart';
import 'package:kafaat/view/pages/auth/signup/signup_page.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';
import 'package:kafaat/view/widgets/social_signin_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final social = SocialLoginProvider.get(context);
    final login = LoginProvider.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 34),
                  const MainText(
                    text: 'Sign In',
                    font: 24,
                    color: AppColors.yTitleColor,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 2),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          getAsset('plus_icon'),
                          height: 10,
                          width: 10,
                          color: AppColors.ySecondary2Color,
                        ),
                        const CircleAvatar(
                          radius: 2.6,
                          backgroundColor: AppColors.yWhiteColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Column(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.ySecondary2Color,
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(right: 20, bottom: 12),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.ySecondary2Color,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: login.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainTextField(
                      controller: login.emailController,
                      hasHint: true,
                      prefixPath: 'email_icon',
                      hint: 'Email',
                      type: TextInputType.emailAddress,
                      valid: (String? v) => v!.isValidEmail
                          ? null
                          : 'Please Check Your Email Address',
                    ),
                    const SizedBox(height: 40),
                    MainTextField(
                      controller: login.passwordController,
                      hasHint: true,
                      hint: 'Password',
                      prefixPath: 'password_icon',
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      valid: (String? v) => v!.isEmpty
                          ? 'Please Enter your password'
                          : v.length < 6
                              ? 'Make sure your password is not less than 6 characters'
                              : null,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainCheckbox(
                          content: 'Remember Me',
                          onChanged: (bool value) async {
                            login.rememberMe = value;
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.routeTo(
                                context, const ForgetPasswordPage());
                          },
                          child: const MainText(
                            text: 'Forget Password?',
                            color: AppColors.yPrimaryColor,
                            font: 14,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    MainButton(
                      title: 'Sign In',
                      onPressed: () async {
                        if (login.formKey.currentState!.validate()) {
                          await login.login();
                        }
                      },
                      verticalPadding: 16,
                    ),
                    const SizedBox(height: 32),
                    const SocialSigninWidget(),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MainText(
                          text: 'Dont have an account?',
                          font: 17,
                          color: AppColors.yGreyBlckColor,
                          weight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: () {
                            AppRoutes.routeRemoveAllTo(
                                context, const SignupPage());
                          },
                          child: const MainText(
                            text: ' Sign Up',
                            font: 17,
                            color: AppColors.yPrimaryColor,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
