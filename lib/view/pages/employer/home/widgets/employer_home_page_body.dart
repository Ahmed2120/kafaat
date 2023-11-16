import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/notification_icon.dart';
import 'package:kafaat/view/pages/employer/home/widgets/all_applications_card.dart';
import 'package:kafaat/view/pages/employer/home/widgets/profile_view_chart.dart';
import 'package:kafaat/view/pages/employer/home/widgets/total_bookmark_card.dart';
import 'package:kafaat/view/pages/employer/home/widgets/total_messages_card.dart';

class EmployerHomePageBody extends StatelessWidget {
  const EmployerHomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainAppBar(
          isMenu: true,
          title: 'Superio',
          actionWidgets: [
            NotificationIcon(),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: 'Howdy, Candidate!!',
                    font: 16,
                    weight: FontWeight.w600,
                    color: AppColors.yDarkColor,
                  ),
                  SizedBox(height: 6),
                  MainText(
                    text: 'Ready to jump back in?',
                    font: 16,
                    weight: FontWeight.w400,
                    color: AppColors.yBodyColor,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      AllAplicationsCard(),
                      SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 220,
                          child: Column(
                            children: [
                              TotalMessagesCard(),
                              SizedBox(height: 10),
                              TotalBookmarkCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  MainText(
                    text: 'Your Profile Views',
                    font: 22,
                    weight: FontWeight.w700,
                    color: AppColors.yBlackColor,
                  ),
                  SizedBox(height: 25),
                  ProfileViewChart(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EmployerHomePageBodyLoading extends StatelessWidget {
  const EmployerHomePageBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainAppBar(
          isMenu: true,
          title: 'Superio',
          actionWidgets: [
            NotificationIcon(),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainText(
                    text: 'Howdy, Candidate!!',
                    font: 16,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(height: 6),
                  const MainText(
                    text: 'Ready to jump back in?',
                    font: 16,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 220,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 220,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const MainText(
                    text: 'Your Profile Views',
                    font: 22,
                    weight: FontWeight.w700,
                    color: AppColors.yBlackColor,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 250,
                    width: context.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.yWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
