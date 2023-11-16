import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final auth = AuthProvider.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Image.asset(
                getAsset('reset_password_icon'),
                height: 121,
                width: 121,
              ),
              const SizedBox(height: 20),
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const MainText(
                      text: 'Reset new password',
                      font: 24,
                      textAlign: TextAlign.center,
                      color: AppColors.yTitleColor,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(height: 30),
                    MainTextField(
                      // controller: auth.resetPasswordController,
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
                    const MainTextField(
                      // controller: auth.resetConfirmPasswordController,
                      hasHint: true,
                      hint: 'Confirm Password',
                      prefixPath: 'password_icon',
                      hintFont: 14,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      // valid: (String? v) => v!.isEmpty
                      //     ? 'Please Enter your password'
                      //     : v.length < 6
                      //         ? 'Make sure your password is not less than 6 characters'
                      //         : v != auth.resetPasswordController.text
                      //             ? 'Please Check your password'
                      //             : null,
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      title: 'Save Changes',
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          // await auth.resetPassword();
                        }
                      },
                      verticalPadding: 16,
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
