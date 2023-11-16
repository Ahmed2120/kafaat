import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
              const SizedBox(height: 20),
              Image.asset(
                getAsset('forget_password_icon'),
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
                      text: 'Forgot password ?',
                      font: 24,
                      textAlign: TextAlign.center,
                      color: AppColors.yTitleColor,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(height: 30),
                    const MainText(
                      text:
                          'Enter your Email then we will send you reset link\nto reset new password.',
                      font: 15,
                      textAlign: TextAlign.center,
                      color: AppColors.yBodyColor,
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(height: 30),
                    MainTextField(
                      // controller: auth.forgetEmailController,
                      hasHint: true,
                      prefixPath: 'email_icon',
                      hint: 'Email',
                      type: TextInputType.emailAddress,
                      valid: (String? v) => v!.isValidEmail
                          ? null
                          : 'Please Check Your Email Address',
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      title: 'Send Link',
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          // await auth.sendOtp();
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
