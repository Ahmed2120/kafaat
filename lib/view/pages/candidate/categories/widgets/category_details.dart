import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/categories/widgets/job_by_category_card.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/retry_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  final int id;
  final String title;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      JobsProvider.listenFalse(context)
          .jobsByCategory(categoryId: widget.id, retry: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          MainAppBar(title: widget.title),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  MainTextField(
                    hint: 'Search By Name',
                    prefixPath: 'search_icon',
                    onChanged: (value) {
                      jobs.jobsByCategory(categoryId: widget.id, retry: true);
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
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
                  jobs.jobsByCategoryStatus == DataStatus.successed
                      ? (jobs.categoryJobsModel != null &&
                              jobs.categoryJobsModel!.openJobs!.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int i) {
                                  return JobsByCategoryItem(
                                      categoryName:
                                          jobs.categoryJobsModel!.name!,
                                      job:
                                          jobs.categoryJobsModel!.openJobs![i]);
                                },
                                itemCount:
                                    jobs.categoryJobsModel!.openJobs!.length,
                              ),
                            )
                          : Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      getAsset('not_found'),
                                    ),
                                    const SizedBox(height: 20),
                                    const MainText(
                                      text: 'No results found',
                                      font: 18,
                                      weight: FontWeight.w600,
                                    ),
                                    const SizedBox(height: 20),
                                    const MainText(
                                      text:
                                          'The search could not be found, please check spelling or write another word.',
                                      font: 14,
                                      weight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                      color: AppColors.yBodyColor,
                                    ),
                                  ],
                                ),
                              ),
                            )
                      : jobs.jobsByCategoryStatus == DataStatus.error
                          ? RetryWidget(retryCallback: () {
                              jobs.jobsByCategory(
                                  retry: true, categoryId: widget.id);
                            })
                          : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
