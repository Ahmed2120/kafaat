import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/manage_jobs_model.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/widgets/job_details.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class AllJobsItem extends StatelessWidget {
  final Job job;

  const AllJobsItem({required this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.routeTo(context, JobDetailsPage(job: job));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.only(right: 4, left: 4, bottom: 16),
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
              children: [
                Image.asset(
                  getAsset('apple_icon'),
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: job.title,
                        font: 13,
                        weight: FontWeight.bold,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MainText(
                            text: job.salaryMin ?? '0',
                            font: 13,
                            color: AppColors.ySecondaryColor,
                            weight: FontWeight.w500,
                          ),
                          MainText(
                            text: '/${job.salaryType}',
                            font: 12,
                            color: AppColors.yBodyColor,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // width: 70,
                  // height: 35,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      color: job.status != 'closed'
                          ? AppColors.yGreenColor.withOpacity(0.1)
                          : AppColors.yRedColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: MainText(
                    text: job.status,
                    color: job.status != 'closed'
                        ? AppColors.yGreenColor
                        : AppColors.yRedColor,
                    font: 12,
                    weight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      getAsset('paypal_icon'),
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 8),
                    MainText(
                      text: job.company!.name,
                      font: 12,
                      color: AppColors.yBodyColor,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 2,
                  width: 2,
                  color: AppColors.yDarkColor,
                ),
                Row(
                  children: [
                    Image.asset(
                      getAsset('duration_icon'),
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 4),
                    MainText(
                      text: job.expirationDate!
                          .substring(0, 10)
                          .replaceAll(RegExp(r'-'), '/'),
                      font: 12,
                      color: AppColors.yBodyColor,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffCBC9D4).withOpacity(0.2)),
                  child: MainText(
                    text: job.category!.name,
                    font: 12,
                    color: const Color(0xff524B6B),
                    weight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffCBC9D4).withOpacity(0.2)),
                  child: const MainText(
                    text: 'Full time',
                    font: 12,
                    color: Color(0xff524B6B),
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
