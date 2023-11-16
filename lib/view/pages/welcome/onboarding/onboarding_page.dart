import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/onboarding_model.dart';
import 'package:kafaat/view/pages/auth/login/login_page.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: onBoardingList.length,
        onPageChanged: (int i) {
          setState(() {
            index = i;
          });
        },
        itemBuilder: (BuildContext context, int i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          getAsset(onBoardingList[i].backgroundPath),
                          width: 330,
                        ),
                        Image.asset(
                          getAsset(onBoardingList[i].imagePath),
                          width: 350,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '${onBoardingList[i].title}\n'),
                          TextSpan(
                            text: '${onBoardingList[i].lastTitle} ',
                          ),
                          TextSpan(
                            text: onBoardingList[i].lastWord,
                            style: const TextStyle(
                                color: AppColors.ySecondaryColor),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.yDarkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: '${onBoardingList[i].description}\n'),
                          TextSpan(
                            text: '${onBoardingList[i].secondaryDescription} ',
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.yDarkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (index != (onBoardingList.length - 1)) {
                            controller.jumpToPage(index + 1);
                          } else {
                            LocalData.setBool(LocalKeys.isFirstOpenApp, false);
                            AppRoutes.routeRemoveAllTo(
                                context, const LoginPage());
                          }
                        },
                        child: Image.asset(
                          getAsset('next_button'),
                          height: 62,
                          width: 62,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          LocalData.setBool(LocalKeys.isFirstOpenApp, false);
                          AppRoutes.routeRemoveAllTo(
                              context, const LoginPage());
                        },
                        child: const MainText(
                          text: 'Skip',
                          font: 16,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingList.length,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 6,
                        width: i == index ? 34 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: i == index
                              ? AppColors.yPrimaryColor
                              : AppColors.yGreyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
