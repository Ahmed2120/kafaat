import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Privacy Stetesment'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocalData.isPrivacyAgree
                      ? const SizedBox()
                      : const MainText(
                          text:
                              'To continue, please accept our terms of service',
                          font: 16,
                          weight: FontWeight.w400,
                          color: AppColors.yTitleColor,
                        ),
                  const SizedBox(height: 40),
                  MainText(
                    text:
                        '''If you’re under the age required to manage your own Google Account, you must have your parent or legal guardian’s permission to use a Google Account. Please have your parent or legal guardian read these terms with you.
          
If you’re a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and you’re responsible for your child’s activity on the services.

If you’re a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and you’re responsible for your child’s activity on the services.
          
Some Google services have additional age requirements as described in their service-specific additional terms and policies.

Some Google services have additional age requirements as described in their service-specific additional terms and policies.''',
                    font: 14,
                    weight: FontWeight.w400,
                    color: AppColors.yBlackColor.withOpacity(0.8),
                  ),
                  const SizedBox(height: 20),
                  LocalData.isPrivacyAgree
                      ? const SizedBox()
                      : MainCheckbox(
                          onChanged: (bool v) {
                            setState(() {
                              isAgree = v;
                            });
                          },
                          initialValue: isAgree,
                          content: 'I agree with all terms of service',
                          textColor: AppColors.yTitleColor,
                        ),
                ],
              ),
            ),
          ),
          LocalData.isPrivacyAgree
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: MainButton(
                    title: 'Agree',
                    withIcon: true,
                    iconPath: 'button_arrow',
                    onPressed: () async {
                      if (isAgree) {
                        await LocalData.setBool(LocalKeys.isPrivacyAgree, true);
                        setState(() {});
                        showSnackbar('I have agreed to the privacy policies');
                      } else {
                        showSnackbar('Please agree to privacy first.',
                            error: true);
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
