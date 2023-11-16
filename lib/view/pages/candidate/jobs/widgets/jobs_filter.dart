import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/models/jobs_model.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class JobsFiltersPage extends StatefulWidget {
  const JobsFiltersPage({Key? key}) : super(key: key);

  @override
  State<JobsFiltersPage> createState() => _JobsFiltersPageState();
}

class _JobsFiltersPageState extends State<JobsFiltersPage> {
  SfRangeValues salaryRange = const SfRangeValues(0.0, 4500.0);
  List<ListCategories>? allCategories;
  List<ListLocations>? locations;
  late final JobsProvider jobs;
  // Selected
  int? categoryId;
  int? locationId;
  String? selectedDatePosted;
  List<String> selectedJobTypes = [];
  List<String> selectedExperiences = [];
  SfRangeValues salaryFromTo = const SfRangeValues(0.0, 4500.0);

  Map<String, String> experienceLevels = {
    'fresh': 'Fresh',
    '1': '1 Year',
    '2': '2 Years',
    '3': '3 Years',
    '4': '4 Years',
    '5': '5 Years',
  };
  Map<String, String> datePosted = {
    'all': 'All',
    'last_hour': 'Last Hour',
    'last_1': 'Last 24 Hours',
    'last_7': 'Last 7 Days',
    'last_14': 'Last 14 Days',
    'last_30': 'Last 30 Days'
  };
  Map<String, String> jobTypes = {
    '1': 'Freelance',
    '2': 'Full Time',
    '3': 'Internship',
    '4': 'Part Time',
    '5': 'Temporary',
  };
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      jobs = JobsProvider.listenFalse(context);
      allCategories = jobs.allJobsModel!.listCategories!;
      locations = jobs.allJobsModel!.listLocations!;
      if (jobs.jobFilters != null) {
        locationId = jobs.jobFilters!.location;
        categoryId = jobs.jobFilters!.category;
        selectedJobTypes = jobs.jobFilters!.jobTypes ?? [];
        selectedDatePosted = jobs.jobFilters!.datePosted;
        selectedExperiences = jobs.jobFilters!.experiences ?? [];
        salaryFromTo = SfRangeValues(jobs.jobFilters!.amountFrom ?? 0.0,
            jobs.jobFilters!.amountTo ?? 4500.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Filters'),
          Expanded(
            child: (locations != null && allCategories != null)
                ? SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Location',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            DropMenu(
                              hint: 'Location',
                              items: locations!
                                  .map((e) => e.name!)
                                  .toSet()
                                  .toList(),
                              initialValue: locations!
                                  .firstWhere(
                                    (item) => item.id == locationId,
                                    orElse: () => ListLocations(),
                                  )
                                  .name,
                              onChanged: (value) {
                                locationId = locations!
                                    .firstWhere((item) => item.name == value)
                                    .id;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Specialization',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            DropMenu(
                              hint: 'Specialization',
                              items: allCategories!
                                  .map((e) => e.name!)
                                  .toSet()
                                  .toList(),
                              initialValue: allCategories!
                                  .firstWhere(
                                    (item) => item.id == categoryId,
                                    orElse: () => ListCategories(),
                                  )
                                  .name,
                              onChanged: (value) {
                                categoryId = allCategories!
                                    .firstWhere((item) => item.name == value)
                                    .id;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Last Update',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                datePosted.keys.toList().length,
                                (i) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedDatePosted =
                                          datePosted.keys.toList()[i];
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio<String>(
                                        value: datePosted.keys.toList()[i],
                                        groupValue: selectedDatePosted,
                                        activeColor: AppColors.yPrimaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedDatePosted = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 4),
                                      MainText(
                                        text: datePosted.values.toList()[i],
                                        font: 16,
                                        weight: FontWeight.w400,
                                        color: AppColors.yMainColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Job Type',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              children: List.generate(
                                jobTypes.keys.toList().length,
                                (i) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedJobTypes.contains(
                                          jobTypes.keys.toList()[i])) {
                                        selectedJobTypes
                                            .remove(jobTypes.keys.toList()[i]);
                                      } else {
                                        selectedJobTypes
                                            .add(jobTypes.keys.toList()[i]);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    margin: const EdgeInsets.only(
                                        right: 20, bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: selectedJobTypes.contains(
                                                jobTypes.keys.toList()[i])
                                            ? AppColors.yPrimaryColor
                                            : const Color(0xffCBC9D4)
                                                .withOpacity(0.2)),
                                    child: MainText(
                                      text: jobTypes.values.toList()[i],
                                      font: 16,
                                      weight: FontWeight.w400,
                                      color: selectedJobTypes.contains(
                                              jobTypes.keys.toList()[i])
                                          ? AppColors.yWhiteColor
                                          : const Color(0xff524B6B),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Salary',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            SfRangeSlider(
                              inactiveColor: AppColors.yGreyColor,
                              activeColor: AppColors.yPrimaryColor,
                              min: salaryRange.start,
                              max: salaryRange.end,
                              values: salaryFromTo,
                              interval: 20,
                              enableTooltip: true,
                              showLabels: false,
                              labelPlacement: LabelPlacement.betweenTicks,
                              minorTicksPerInterval: 1,
                              enableIntervalSelection: false,
                              onChanged: (SfRangeValues values) {
                                setState(() {
                                  salaryFromTo = values;
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Experience',
                                  font: 15,
                                  weight: FontWeight.w600,
                                ),
                                Image.asset(
                                  getAsset('arrow_down'),
                                  height: 14,
                                  width: 14,
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                experienceLevels.keys.toList().length,
                                (i) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: MainCheckbox(
                                    value: selectedExperiences.contains(
                                        experienceLevels.keys.toList()[i]),
                                    onChanged: (value) {
                                      setState(() {
                                        if (value) {
                                          selectedExperiences.add(
                                              experienceLevels.keys
                                                  .toList()[i]);
                                        } else {
                                          selectedExperiences.remove(
                                              experienceLevels.keys
                                                  .toList()[i]);
                                        }
                                      });
                                    },
                                    textColor: AppColors.yBlackColor,
                                    content:
                                        experienceLevels.values.toList()[i],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: MainButton(
                                onPressed: () {
                                  setState(() {
                                    jobs.jobFilters = null;
                                    locationId = null;
                                    categoryId = null;
                                    selectedJobTypes = [];
                                    selectedDatePosted = null;
                                    selectedExperiences = [];
                                    salaryFromTo =
                                        const SfRangeValues(0.0, 4500.0);
                                  });
                                },
                                title: 'Reset',
                                hasShadow: true,
                                font: 16,
                                color: AppColors.yWhiteColor,
                                textColor: AppColors.yPrimaryColor,
                                weight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 3,
                              child: MainButton(
                                onPressed: () {
                                  jobs.jobFilters = JobFilters(
                                    location: locationId,
                                    category: categoryId,
                                    jobTypes: selectedJobTypes,
                                    datePosted: selectedDatePosted,
                                    experiences: selectedExperiences,
                                    amountFrom: salaryFromTo.start,
                                    amountTo: salaryFromTo.end,
                                  );
                                  print(jobs.jobFilters!.toStr());
                                  AppRoutes.pop(context);
                                  jobs.jobs(retry: true);
                                },
                                title: 'Apply Now',
                                font: 16,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : FutureBuilder(
                    future:
                        Future.delayed(const Duration(seconds: 1), () async {
                      setState(() {});
                    }),
                    builder: (context, snapshot) {
                      return const LoadingWidget();
                    }),
          ),
        ],
      ),
    );
  }
}
