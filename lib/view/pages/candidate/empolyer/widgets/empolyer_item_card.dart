import 'package:intl/intl.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/employers_model.dart';
import 'package:kafaat/providers/wishlist_provider.dart';
import 'package:kafaat/view/pages/candidate/empolyer/widgets/empolyer_profile_page.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class EmployerItemCard extends StatelessWidget {
  final Employer employer;

  const EmployerItemCard({required this.employer, Key? key}) : super(key: key);

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
                getAsset('empolyer_user'),
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      text: employer.name,
                      font: 16,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              getAsset('desgin_icon'),
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 8),
                            MainText(
                              text: employer.category?.name ?? '',
                              font: 12,
                              color: AppColors.yBodyColor,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              getAsset('duration_icon'),
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 8),
                            MainText(
                              text: DateFormat('dd/MM/y').format(
                                  DateTime.tryParse(employer.createdAt ?? '') ??
                                      DateTime.now()),
                              font: 12,
                              color: AppColors.yBodyColor,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (wishlists.addWishlistStatus == DataStatus.loading &&
                      wishlists.currentId == employer.id &&
                      wishlists.currentModel == 'employer')
                  ? const LoadingWidget(size: 15, isCircle: true)
                  : InkWell(
                      onTap: () {
                        wishlists.addWishlist(employer.id!,
                            objectModel: 'employer', retry: true);
                      },
                      child: Icon(
                          wishlists.isWishlisted(employer.id!, 'employer')
                              ? Icons.bookmark
                              : Icons.bookmark_outline_rounded),
                    ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.yGreenColor.withOpacity(0.2)),
                child: MainText(
                  text: 'open jobs: ${employer.jobCount ?? ''}',
                  font: 12,
                  color: AppColors.yGreenColor,
                  weight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  AppRoutes.routeTo(
                      context, EmployerProfilePage(slug: employer.slug!));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.yPrimaryColor),
                  child: const MainText(
                    text: 'View',
                    font: 12,
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
