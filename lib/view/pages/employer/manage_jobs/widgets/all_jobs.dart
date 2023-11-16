import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/manage_jobs_provider.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/widgets/all_jobs_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class AllJobsPage extends StatefulWidget {
  const AllJobsPage({
    super.key,
  });

  @override
  State<AllJobsPage> createState() => _AllJobsPageState();
}

class _AllJobsPageState extends State<AllJobsPage> {
  @override
  void initState() {
    super.initState();
    ManageJobsProvider.listenFalse(context).manageJobs();
  }

  @override
  Widget build(BuildContext context) {
    final manageJobs = ManageJobsProvider.get(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTextField(
              hint: 'Search By Name',
              prefixPath: 'search_icon',
              onChanged: (value) {
                manageJobs.manageJobs(keyword: value!);
              },
              // suffixIcon: GestureDetector(
              //   onTap: () {
              //     // AppRoutes.routeTo(
              //     //   context,
              //     // );
              //   },
              //   child: Container(
              //     height: 35,
              //     width: 35,
              //     margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
              //     decoration: BoxDecoration(
              //         color: AppColors.yPrimaryColor,
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Center(
              //       child: Image.asset(
              //         getAsset('filter_icon'),
              //         height: 24,
              //         width: 24,
              //       ),
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: manageJobs.manageJobsStatus == DataStatus.loading
                  ? const LoadingWidget()
                  : manageJobs.manageJobsStatus == DataStatus.successed
                      ? ListView.builder(
                          itemBuilder: (BuildContext context, int i) =>
                              AllJobsItem(
                            job: manageJobs.manageJobModel!.jobs![i],
                          ),
                          itemCount: manageJobs.manageJobModel!.jobs!.length,
                        )
                      : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
