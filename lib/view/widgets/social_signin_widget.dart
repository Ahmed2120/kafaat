import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/social_login_provider.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class SocialSigninWidget extends StatefulWidget {
  const SocialSigninWidget({
    super.key, this.role,
  });
  final String? role;

  @override
  State<SocialSigninWidget> createState() => _SocialSigninWidgetState();
}

class _SocialSigninWidgetState extends State<SocialSigninWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      SocialLoginProvider.listenFalse(context).getSocialMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    final social = SocialLoginProvider.get(context);
    return social.socialMethodsStatus == DataStatus.successed
        ? Column(
            children: [
              if (social.socialMethodsModel?.methods != null) ...{
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xffEFF1F3),
                        width: double.infinity,
                        height: 3,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const MainText(
                      text: 'Or Sign In With',
                      font: 17,
                      weight: FontWeight.w400,
                      color: AppColors.yBodyColor,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        color: const Color(0xffEFF1F3),
                        width: double.infinity,
                        height: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (social.socialMethodsModel?.methods?.facebook?.status ==
                            1 &&
                        social.socialMethodsModel?.methods?.facebook
                                ?.clientId !=
                            null &&
                        social.socialMethodsModel!.methods!.facebook!.clientId!
                            .isNotEmpty) ...{
                      InkWell(
                        onTap: () async {
                          await social.socialSignin(
                              provider: 'facebook', role: widget.role);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          getAsset('facebook'),
                          height: 32,
                          width: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                    },
                    if (social.socialMethodsModel?.methods?.google?.status ==
                            1 &&
                        social.socialMethodsModel?.methods?.google?.clientId !=
                            null &&
                        social.socialMethodsModel!.methods!.google!.clientId!
                            .isNotEmpty) ...{
                      InkWell(
                        onTap: () async {
                          await social.socialSignin(
                              provider: 'google', role: widget.role);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          getAsset('google'),
                          height: 32,
                          width: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                    },
                    if (social.socialMethodsModel?.methods?.twitter?.status ==
                            1 &&
                        social.socialMethodsModel?.methods?.twitter?.clientId !=
                            null &&
                        social.socialMethodsModel!.methods!.twitter!.clientId!
                            .isNotEmpty) ...{
                      InkWell(
                        onTap: () async {
                          await social.socialSignin(
                              provider: 'twitter', role: widget.role);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          getAsset('twitter'),
                          height: 32,
                          width: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                    },
                    if (social.socialMethodsModel?.methods?.linkedin?.status ==
                            1 &&
                        social.socialMethodsModel?.methods?.linkedin
                                ?.clientId !=
                            null &&
                        social.socialMethodsModel!.methods!.linkedin!.clientId!
                            .isNotEmpty) ...{
                      InkWell(
                        onTap: () async {
                          await social.socialSignin(
                              provider: 'linkedin', role: widget.role);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          getAsset('linkedin'),
                          height: 32,
                          width: 32,
                        ),
                      ),
                    },
                  ],
                ),
              },
            ],
          )
        : social.socialMethodsStatus == DataStatus.loading
            ? const CircularProgressIndicator()
            : const SizedBox();
  }
}
