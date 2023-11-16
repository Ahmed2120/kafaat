import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/candidates_model.dart';
import 'package:kafaat/providers/wishlist_provider.dart';
import 'package:kafaat/view/pages/candidate/candidate/widgets/candidate_profile_page.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class CandidateItemCard extends StatelessWidget {
  const CandidateItemCard({Key? key, required this.candidate})
      : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    final wishlists = WishlistsProvider.get(context);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
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
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      text: candidate.user?.name,
                      font: 14,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          getAsset('prog_icon'),
                          height: 18,
                          width: 18,
                          color: AppColors.yBodyColor,
                        ),
                        const SizedBox(width: 6),
                        MainText(
                          text: candidate.title,
                          font: 12,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (wishlists.addWishlistStatus == DataStatus.loading &&
                      wishlists.currentId == candidate.id &&
                      wishlists.currentModel == 'candidate')
                  ? const LoadingWidget(size: 15, isCircle: true)
                  : InkWell(
                      onTap: () {
                        wishlists.addWishlist(candidate.id!,
                            objectModel: 'candidate', retry: true);
                      },
                      child: Icon(
                          wishlists.isWishlisted(candidate.id!, 'candidate')
                              ? Icons.bookmark
                              : Icons.bookmark_outline_rounded),
                    ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MainText(
                text: 'SAR ${candidate.expectedSalary}',
                font: 14,
                color: AppColors.ySecondaryColor,
                weight: FontWeight.w500,
              ),
              const MainText(
                text: '/Mo',
                font: 14,
                color: AppColors.yBodyColor,
                weight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: candidate.categories
                    ?.map(
                      (category) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffCBC9D4).withOpacity(0.2)),
                        child: MainText(
                          text: category.name,
                          font: 12,
                          color: const Color(0xff524B6B),
                          weight: FontWeight.w400,
                        ),
                      ),
                    )
                    .toList() ??
                [],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  AppRoutes.routeTo(
                      context, CandidateProfilePage(slug: candidate.slug!));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.yPrimaryColor.withOpacity(0.2)),
                  child: const MainText(
                    text: 'View Profile',
                    font: 12,
                    color: AppColors.yPrimaryColor,
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
