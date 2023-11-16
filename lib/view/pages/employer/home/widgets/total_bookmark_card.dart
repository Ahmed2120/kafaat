import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/shortlisted_provider.dart';
import 'package:kafaat/view/pages/employer/shortlisted/shortlisted_page.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class TotalBookmarkCard extends StatelessWidget {
  const TotalBookmarkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shortlisted = ShortlistedProvider.get(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AppRoutes.routeTo(context, const ShortlistedPage());
        },
        child: Container(
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
            borderRadius: BorderRadius.circular(12),
            color: AppColors.yWhiteColor,
          ),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: AppColors.yPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    getAsset('bookmark_icon'),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainText(
                      text: 'Total Bookmark',
                      font: 12,
                      weight: FontWeight.bold,
                      color: AppColors.yDarkColor,
                    ),
                    const SizedBox(height: 5),
                    shortlisted.shortlistedModel != null
                        ? MainText(
                            text: shortlisted
                                .shortlistedModel!.shortlists!.length
                                .toString(),
                            font: 14,
                            weight: FontWeight.w400,
                            color: AppColors.yBodyColor,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
