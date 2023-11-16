import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/drawer_model.dart';
import 'package:kafaat/providers/candidate/candidate_profile_provider.dart';
import 'package:kafaat/providers/employer/company_profile_provider.dart';
import 'package:kafaat/view/pages/candidate/my_profile/my_profile_page.dart';
import 'package:kafaat/view/pages/employer/company_profile/company_profile_page.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yDrawerColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (LocalData.userLoginData.role != null) {
                    if (LocalData.userLoginData.role!.isCandidate) {
                      AppRoutes.routeTo(context, const MyProfilePage());
                    } else {
                      AppRoutes.routeTo(context, const CompanyProfilePage());
                    }
                  }
                },
                child: SizedBox(
                  width: context.width * 0.6,
                  child: FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Image.asset(
                            getAsset('empolyer_icon'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Consumer<CompanyProfileProvider>(
                          builder: (context, value, child) {
                            return Consumer<CandidateProfileProvider>(
                              builder: (context, value, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainText(
                                      text: LocalData.userProfileData.name,
                                      font: 18,
                                      weight: FontWeight.w500,
                                      color: AppColors.yTitleColor,
                                    ),
                                    MainText(
                                      text: LocalData.userProfileData.email,
                                      font: 14,
                                      weight: FontWeight.w400,
                                      color: AppColors.yBodyColor,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 32),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: DrawerServise.drawerList.length,
                  itemBuilder: (BuildContext context, int i) => Container(
                    width: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    padding: DrawerServise.drawerList.last ==
                            DrawerServise.drawerList[i]
                        ? const EdgeInsets.only(top: 12)
                        : null,
                    child: ListTile(
                      onTap: DrawerServise.drawerList[i].onTap,
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: AppColors.yPrimaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Image.asset(
                            getAsset(DrawerServise.drawerList[i].icon),
                            color: AppColors.yPrimaryColor,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      title: MainText(
                        text: DrawerServise.drawerList[i].title,
                        font: 14,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  getAsset('drawer_app_logo'),
                  width: 77,
                  height: 77,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget drowerMenu(BuildContext context) {
//   return Scaffold(
//     backgroundColor: AppColors.yDrawerColor,
//     body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             InkWell(
//               onTap: () {
//                 AppRoutes.routeTo(context, const ProfilePage());
//               },
//               child: SizedBox(
//                 width: context.width * 0.6,
//                 child: FittedBox(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CircleAvatar(
//                         radius: 40,
//                         child: Image.asset(
//                           getAsset('empolyer_icon'),
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Consumer<CandidateProfileProvider>(
//                         builder: (context, value, child) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               MainText(
//                                 text: LocalData.userProfileData.name,
//                                 font: 18,
//                                 weight: FontWeight.w500,
//                                 color: AppColors.yTitleColor,
//                               ),
//                               MainText(
//                                 text: LocalData.userProfileData.email,
//                                 font: 14,
//                                 weight: FontWeight.w400,
//                                 color: AppColors.yBodyColor,
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                       const SizedBox(width: 32),
//                       const Icon(Icons.arrow_forward_ios),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: DrawerServise.drawerList.length,
//                 itemBuilder: (BuildContext context, int i) => Container(
//                   width: 250,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(25),
//                       bottomRight: Radius.circular(25),
//                     ),
//                   ),
//                   padding: DrawerServise.drawerList.last ==
//                           DrawerServise.drawerList[i]
//                       ? const EdgeInsets.only(top: 12)
//                       : null,
//                   child: ListTile(
//                     onTap: DrawerServise.drawerList[i].onTap,
//                     leading: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                           color: AppColors.yPrimaryColor.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(8)),
//                       child: Center(
//                         child: Image.asset(
//                           getAsset(DrawerServise.drawerList[i].icon),
//                           color: AppColors.yPrimaryColor,
//                           height: 15,
//                           width: 15,
//                         ),
//                       ),
//                     ),
//                     title: MainText(
//                       text: DrawerServise.drawerList[i].title,
//                       font: 14,
//                       weight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 getAsset('drawer_app_logo'),
//                 width: 77,
//                 height: 77,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
