import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/application_provider.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/manage_jobs_page.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class AllAplicationsCard extends StatelessWidget {
  const AllAplicationsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final applications = ApplicationProvider.get(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AppRoutes.routeTo(context, const ManageJobsPage(current: 1));
        },
        child: Container(
          height: 220,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.yBlackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: AppColors.yWhiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: AppColors.yPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    getAsset('applications_icon'),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const MainText(
                text: 'Total Applicants',
                font: 16,
                weight: FontWeight.w500,
                color: AppColors.yDarkColor,
              ),
              const SizedBox(height: 15),
              applications.applicationModel != null
                  ? MainText(
                      text: applications.applicationModel!.applications!.length
                          .toString(),
                      font: 14,
                      weight: FontWeight.w400,
                      color: AppColors.yBodyColor,
                    )
                  : const SizedBox(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
