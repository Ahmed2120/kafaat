import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/categories_model.dart';
import 'package:kafaat/providers/candidate/categories_provider.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/categories/categories_page.dart';
import 'package:kafaat/view/pages/candidate/home/widgets/banners_widget.dart';
import 'package:kafaat/view/pages/candidate/home/widgets/category_home_card.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/job_item_card.dart';
import 'package:kafaat/view/pages/candidate/jobs/jobs_page.dart';
import 'package:kafaat/view/pages/candidate/search/search_page.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/notification_icon.dart';

class CandidateHomePageBody extends StatelessWidget {
  const CandidateHomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesProvider.get(context);
    final jobs = JobsProvider.get(context);
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
                  MainTextField(
                    hint: 'Search Jobs....',
                    prefixPath: 'search_icon',
                    read: true,
                    onTap: () {
                      AppRoutes.routeTo(context, const SearchPage());
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        AppRoutes.routeTo(context, const SearchPage());
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        margin:
                            const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            color: AppColors.yPrimaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Image.asset(
                            getAsset('filter_icon'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const BannersCarousel(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(
                        text: 'Categories',
                        font: 16,
                        color: AppColors.yBlackColor,
                        weight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRoutes.routeTo(context, const CategoriesPage());
                        },
                        child: MainText(
                          text: 'See All',
                          font: 14,
                          color: AppColors.yPrimaryColor.withOpacity(0.8),
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 175,
                    child: Row(
                      children: [
                        Expanded(
                          child: CategoryHomeCard(
                            category:
                                categories.categoriesModel!.categories![0],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: CategoryHomeCard(
                                  category: categories
                                      .categoriesModel!.categories![1],
                                  horizontal: true,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: CategoryHomeCard(
                                  category: categories
                                      .categoriesModel!.categories![2],
                                  horizontal: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MainText(
                        text: 'Recent Job List',
                        font: 17,
                        color: AppColors.yBlackColor,
                        weight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRoutes.routeTo(context, const JobsPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainText(
                              text: 'See All',
                              font: 14,
                              color: AppColors.yPrimaryColor.withOpacity(0.8),
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  jobs.jobModel != null
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int i) =>
                              JobItemCard(
                            job: jobs.jobModel!.allJobs!.jobs![i],
                          ),
                          itemCount: jobs.jobModel!.allJobs!.jobs!.length,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CandidateHomePageBodyLoading extends StatelessWidget {
  const CandidateHomePageBodyLoading({super.key});

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
                  MainTextField(
                    hint: 'Search Jobs....',
                    prefixPath: 'search_icon',
                    suffixIcon: Container(
                      height: 35,
                      width: 35,
                      margin:
                          const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BannersCarousel(),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainText(
                        text: 'Categories',
                        font: 17,
                        weight: FontWeight.w600,
                      ),
                      MainText(
                        text: 'See All',
                        font: 14,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 175,
                    child: Row(
                      children: [
                        Expanded(
                          child: CategoryHomeCard(
                            category: CategoryModel(name: '', openJobsCount: 0),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: CategoryHomeCard(
                                  category:
                                      CategoryModel(name: '', openJobsCount: 0),
                                  horizontal: true,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: CategoryHomeCard(
                                  category:
                                      CategoryModel(name: '', openJobsCount: 0),
                                  horizontal: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainText(
                        text: 'Recent Job List',
                        font: 17,
                        weight: FontWeight.w600,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainText(
                            text: 'See All',
                            font: 14,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
