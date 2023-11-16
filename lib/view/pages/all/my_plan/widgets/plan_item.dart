import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/plan_model.dart';
import 'package:kafaat/view/pages/all/my_plan/checkout/checkout_page.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({
    Key? key,
    required this.plan,
    required this.isAnnual,
  }) : super(key: key);
  final Plan plan;
  final bool isAnnual;

  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'<li><span>(.*?)</span></li>');
    Iterable<RegExpMatch> matches = regex.allMatches(plan.content!);

    List<String> contents = [];
    for (RegExpMatch match in matches) {
      contents.add('➥  ${match.group(1)!}');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
            color: AppColors.yWhiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.yBlackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainText(
                  text: plan.title,
                  font: 16,
                  weight: FontWeight.bold,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: plan.isRecommended == 1
                          ? AppColors.yGreenColor.withOpacity(0.1)
                          : AppColors.yPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: MainText(
                    text: plan.isRecommended == 1 ? 'Recommended' : 'Basic',
                    color: plan.isRecommended == 1
                        ? AppColors.yGreenColor
                        : AppColors.yPrimaryColor,
                    font: 14,
                    weight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MainText(
                  text: '\$${isAnnual ? plan.annualPrice : plan.price}',
                  font: 15,
                  color: AppColors.ySecondaryColor,
                  weight: FontWeight.w500,
                ),
                MainText(
                  text: isAnnual ? '/year' : '/month',
                  font: 14,
                  color: AppColors.yBodyColor,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              contents.length,
              (i) => MainText(
                text: contents[i],
                font: 14,
                lineHeight: 2,
                color: const Color(0xff524B6B),
                weight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            MainButton(
              title: 'Select',
              isTransparent: true,
              borderColor: AppColors.yPrimaryColor,
              textColor: AppColors.yPrimaryColor,
              withBorder: true,
              onPressed: () {
                AppRoutes.routeTo(
                  context,
                  CheckoutPage(plan: plan, isAnnual: isAnnual),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
