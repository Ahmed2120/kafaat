import 'package:flutter/cupertino.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/pages/all/settings/profile/profile_page.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationValue = false;
  bool updateValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Settings'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SettingsItem(
                      title: 'Update Password',
                      icon: 'Profile',
                      onTap: () {
                        AppRoutes.routeTo(context, const ProfilePage());
                      },
                    ),
                    // SettingsItem(
                    //   title: 'Profile',
                    //   icon: 'Profile',
                    //   onTap: () {
                    //     AppRoutes.routeTo(context, const ProfilePage());
                    //   },
                    // ),
                    // SettingsItem(
                    //   title: 'Contact',
                    //   icon: 'contact_us',
                    //   onTap: () {
                    //     AppRoutes.routeTo(context, const ContactUsPage());
                    //   },
                    // ),
                    // SettingsItem(
                    //   title: 'FAQ',
                    //   icon: 'faq_icon',
                    //   onTap: () {
                    //     AppRoutes.routeTo(context, const FAQPage());
                    //   },
                    // ),
                    // SettingsItem(
                    //   title: 'About us',
                    //   icon: 'about_icon',
                    //   onTap: () {
                    //     AppRoutes.routeTo(context, const AboutPage());
                    //   },
                    // ),
                    // SettingsItem(
                    //   title: 'Privacy Stetesment',
                    //   icon: 'privacy_icon',
                    //   onTap: () {
                    //     AppRoutes.routeTo(context, const PrivacyPage());
                    //   },
                    // ),
                    // SettingsItem(
                    //   title: 'Notification',
                    //   icon: 'notification_settings_icon',
                    //   isSwitch: true,
                    //   state: notificationValue,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       notificationValue = value;
                    //     });
                    //   },
                    //   onTap: () {},
                    // ),
                    // SettingsItem(
                    //   title: 'Update',
                    //   icon: 'update_icon',
                    //   isSwitch: true,
                    //   state: updateValue,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       updateValue = value;
                    //     });
                    //   },
                    //   onTap: () {},
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.isSwitch = false,
    this.state = false,
    this.onChanged,
    this.onTap,
  });
  final String title;
  final String icon;
  final bool isSwitch;
  final bool state;
  final void Function()? onTap;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: ListTile(
        minVerticalPadding: 24,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: MainText(
          text: title,
          font: 18,
        ),
        trailing: isSwitch
            ? CupertinoSwitch(
                value: state,
                activeColor: AppColors.yPrimaryColor,
                onChanged: onChanged,
              )
            : const Icon(Icons.arrow_forward_ios_rounded),
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.yPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              getAsset(icon),
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
