import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/edit_password_provider.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editPassword = EditPasswordProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Edit Profile'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: editPassword.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    // Container(
                    //   height: 89,
                    //   width: 89,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(36),
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //         getAsset('profile_img'),
                    //       ),
                    //     ),
                    //   ),
                    //   alignment: Alignment.bottomRight,
                    //   child: CircleAvatar(
                    //     radius: 17,
                    //     backgroundColor: AppColors.yPrimaryColor,
                    //     child: Image.asset(
                    //       getAsset('Edit'),
                    //       width: 15,
                    //       height: 15,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 50),
                    // MainTextField(
                    //   hasHint: true,
                    //   hintFont: 14,
                    //   prefixPath: 'username_icon',
                    //   hint: 'UserName',
                    //   type: TextInputType.text,
                    //   initialValue: LocalData.userProfileData.name,
                    //   valid: (String? v) =>
                    //       v!.isEmpty ? 'Please Enter Your User Name' : null,
                    // ),
                    // const SizedBox(height: 30),
                    // MainTextField(
                    //   hasHint: true,
                    //   hint: 'Enter Email Address',
                    //   prefixPath: 'email_icon',
                    //   hintFont: 14,
                    //   type: TextInputType.emailAddress,
                    //   initialValue: LocalData.userProfileData.email,
                    //   valid: (String? v) => !v!.isValidEmail
                    //       ? 'Please Check Your Email Address'
                    //       : null,
                    // ),
                    // const SizedBox(height: 30),
                    // MainTextField(
                    //   hasHint: true,
                    //   hint: 'Enter Password',
                    //   prefixPath: 'password_icon',
                    //   hintFont: 14,
                    //   type: TextInputType.visiblePassword,
                    //   isPassword: true,
                    //   valid: (String? v) => v!.isEmpty
                    //       ? 'Please Enter your password'
                    //       : v.length < 8
                    //           ? 'Make sure your password is not less than 8 characters'
                    //           : null,
                    // ),
                    const SizedBox(height: 30),
                    MainTextField(
                      controller: editPassword.currentPasswordController,
                      hasHint: true,
                      hint: 'Current Password',
                      prefixPath: 'password_icon',
                      hintFont: 14,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      valid: (String? v) => v!.isEmpty
                          ? 'Please Enter your password'
                          : v.length < 6
                              ? 'Make sure your password is not less than 8 characters'
                              : null,
                    ),
                    const SizedBox(height: 30),
                    MainTextField(
                      controller: editPassword.newPasswordController,
                      hasHint: true,
                      hint: 'New Password',
                      prefixPath: 'password_icon',
                      hintFont: 14,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      valid: (String? v) => v!.isEmpty
                          ? 'Please Enter your password'
                          : v.length < 8
                              ? 'Make sure your password is not less than 8 characters'
                              : null,
                    ),
                    const SizedBox(height: 30),
                    MainTextField(
                      controller: editPassword.confirmNewPasswordController,
                      hasHint: true,
                      hint: 'Confirm New Password',
                      prefixPath: 'password_icon',
                      hintFont: 14,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      valid: (String? v) => v!.isEmpty
                          ? 'Please Enter your password'
                          : v.length < 8
                              ? 'Make sure your password is not less than 8 characters'
                              : v != editPassword.newPasswordController.text
                                  ? 'Confirm Password must match New Password'
                                  : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MainButton(
              title: 'Save edit',
              onPressed: () async {
                if (editPassword.formKey.currentState!.validate()) {
                  await editPassword.editPassword();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
