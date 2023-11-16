import 'package:intl/intl.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/jobs_model.dart';
import 'package:kafaat/providers/wishlist_provider.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/apply_job.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class JobItemCard extends StatelessWidget {
  final Job job;

  const JobItemCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlists = WishlistsProvider.get(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(bottom: 20, left: 4, right: 4),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                getAsset('apple_icon'),
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      text: job.title,
                      font: 16,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                getAsset('desgin_icon'),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 4),
                              MainText(
                                text: job.category!.name!,
                                font: 12,
                                color: AppColors.yBodyColor,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Row(
                            children: [
                              Image.asset(
                                getAsset('duration_icon'),
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 4),
                              MainText(
                                text: DateFormat('dd/MM/yyyy')
                                    .format(DateTime.parse(job.createdAt!)),
                                font: 12,
                                color: AppColors.yBodyColor,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              (wishlists.addWishlistStatus == DataStatus.loading &&
                      wishlists.currentId == job.id &&
                      wishlists.currentModel == 'job')
                  ? const LoadingWidget(size: 15, isCircle: true)
                  : InkWell(
                      onTap: () {
                        wishlists.addWishlist(job.id!,
                            objectModel: 'job', retry: true);
                      },
                      child: Icon(wishlists.isWishlisted(job.id!, 'job')
                          ? Icons.bookmark
                          : Icons.bookmark_outline_rounded),
                    ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              job.salaryMin != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MainText(
                          text: 'SAR ${num.parse(job.salaryMin!).toInt()}',
                          font: 12,
                          color: AppColors.ySecondaryColor,
                          weight: FontWeight.w500,
                        ),
                        const MainText(
                          text: '/Mo - ',
                          font: 12,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ],
                    )
                  : const SizedBox(),
              job.salaryMax != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MainText(
                          text: 'SAR ${num.parse(job.salaryMax!).toInt()}',
                          font: 12,
                          color: AppColors.ySecondaryColor,
                          weight: FontWeight.w500,
                        ),
                        const MainText(
                          text: '/Mo',
                          font: 12,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffCBC9D4).withOpacity(0.2)),
                child: MainText(
                  text: job.status,
                  font: 12,
                  color: const Color(0xff524B6B),
                  weight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 8),
              job.salaryType != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffCBC9D4).withOpacity(0.2)),
                      child: MainText(
                        text: job.salaryType,
                        font: 12,
                        color: const Color(0xff524B6B),
                        weight: FontWeight.w400,
                      ),
                    )
                  : const SizedBox(),
              const Spacer(),
              InkWell(
                onTap: () {
                  AppRoutes.routeTo(context, ApplyJobPage(slugId: job.slug!));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.yPrimaryColor),
                  child: const MainText(
                    text: 'Apply',
                    font: 14,
                    color: AppColors.yWhiteColor,
                    weight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
