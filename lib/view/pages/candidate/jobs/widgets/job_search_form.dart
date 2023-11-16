import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/jobs_filter.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class JobSearchForm extends StatefulWidget {
  const JobSearchForm({super.key});

  @override
  State<JobSearchForm> createState() => _JobSearchFormState();
}

class _JobSearchFormState extends State<JobSearchForm> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextField(
          controller: controller,
          hint: 'Search Job...',
          prefixPath: 'search_icon',
          onChanged: (value) async {
            if (value != null && value.isNotEmpty) {
              if (jobs.jobFilters == null) {
                jobs.jobFilters = JobFilters(keyword: value);
              } else {
                jobs.jobFilters!.keyword = value;
              }
            } else {
              if (jobs.jobFilters == null) {
                jobs.jobFilters = JobFilters(keyword: null);
              } else {
                jobs.jobFilters!.keyword = null;
              }
              if (jobs.jobFilters != null && jobs.jobFilters!.isAllNullVars) {
                jobs.jobFilters = null;
              }
            }
            await jobs.jobs(retry: true);
          },
          suffixIcon: GestureDetector(
            onTap: () {
              AppRoutes.routeTo(context, const JobsFiltersPage());
            },
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
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
        const SizedBox(height: 8),
        jobs.jobFilters == null
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  controller.clear();
                  jobs.jobFilters = null;
                  jobs.jobs(retry: true);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.close_rounded,
                      color: AppColors.yPrimaryColor,
                      size: 18,
                    ),
                    MainText(
                      text: 'Filters Reset',
                      color: AppColors.yPrimaryColor,
                      font: 12,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
