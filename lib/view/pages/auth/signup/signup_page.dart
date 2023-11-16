import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/signup_provider.dart';
import 'package:kafaat/providers/auth/social_login_provider.dart';
import 'package:kafaat/view/pages/auth/login/login_page.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/social_signin_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    // final social = SocialLoginProvider.get(context);
    final signup = SignupProvider.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 34),
                const MainText(
                  text: 'Sign Up',
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.yPrimaryColor.withOpacity(0.05)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: List.generate(
                  signup.roleList.length,
                  (i) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          signup.current = i;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: signup.current == i
                              ? [
                                  BoxShadow(
                                    color:
                                        AppColors.yBlackColor.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                          borderRadius: BorderRadius.circular(12),
                          color: signup.current == i
                              ? AppColors.yWhiteColor
                              : Colors.transparent,
                        ),
                        height: 40,
                        child: Center(
                          child: MainText(
                            text: signup.roleList[i],
                            font: 14,
                            weight: FontWeight.w500,
                            color: signup.current == i
                                ? AppColors.yPrimaryColor
                                : AppColors.yDisableTabColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: signup.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MainTextField(
                              controller: signup.firstNameController,
                              hasHint: true,
                              prefixPath: 'username_icon',
                              hint: 'First Name',
                              hintFont: 12,
                              type: TextInputType.text,
                              valid: (String? v) => v!.isEmpty
                                  ? 'Please Enter Your User Name'
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: MainTextField(
                              controller: signup.lastNameController,
                              hasHint: true,
                              hintFont: 12,
                              prefixPath: 'username_icon',
                              hint: 'Last Name',
                              type: TextInputType.text,
                              valid: (String? v) => v!.isEmpty
                                  ? 'Please Enter Your User Name'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      MainTextField(
                        controller: signup.emailController,
                        hasHint: true,
                        hint: 'Enter Email Address',
                        prefixPath: 'email_icon',
                        hintFont: 14,
                        type: TextInputType.emailAddress,
                        valid: (String? v) => v!.isValidEmail
                            ? null
                            : 'Please Check Your Email Address',
                      ),
                      const SizedBox(height: 30),
                      MainTextField(
                        controller: signup.passwordController,
                        hasHint: true,
                        hint: 'Enter Password',
                        prefixPath: 'password_icon',
                        hintFont: 14,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        valid: (String? v) => v!.isEmpty
                            ? 'Please Enter your password'
                            : v.length < 6
                                ? 'Make sure your password is not less than 6 characters'
                                : null,
                      ),
                      const SizedBox(height: 30),
                      MainTextField(
                        controller: signup.confirmPasswordController,
                        hasHint: true,
                        hint: 'Confirm Password',
                        prefixPath: 'password_icon',
                        hintFont: 14,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        valid: (String? v) => v!.isEmpty
                            ? 'Please Enter your password'
                            : v.length < 6
                                ? 'Make sure your password is not less than 6 characters'
                                : v != signup.confirmPasswordController.text
                                    ? 'Please Check your password'
                                    : null,
                      ),
                      const SizedBox(height: 40),
                      MainButton(
                        title: 'Sign Up',
                        onPressed: () async {
                          if (signup.formKey.currentState!.validate()) {
                            await signup.signup();
                          }
                        },
                        verticalPadding: 16,
                      ),
                      const SizedBox(height: 30),
                      SocialSigninWidget(
                          role: signup.roleList[signup.current].toLowerCase()),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MainText(
                            text: 'Already have an account?',
                            font: 17,
                            color: AppColors.yGreyBlckColor,
                            weight: FontWeight.w400,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppRoutes.routeRemoveAllTo(
                                  context, const LoginPage());
                            },
                            child: const MainText(
                              text: ' Sign In',
                              font: 17,
                              color: AppColors.ySecondary2Color,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
