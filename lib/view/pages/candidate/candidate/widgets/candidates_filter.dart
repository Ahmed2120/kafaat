import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/models/candidates_model.dart';
import 'package:kafaat/providers/candidate/candidates_provider.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class CandidatesFiltersPage extends StatefulWidget {
  const CandidatesFiltersPage({Key? key}) : super(key: key);

  @override
  State<CandidatesFiltersPage> createState() => _CandidatesFiltersPageState();
}

class _CandidatesFiltersPageState extends State<CandidatesFiltersPage> {
  List<ListCategories>? allCategories;
  List<ListLocations>? locations;
  List<ListSkills>? skills;
  late final CandidatesProvider candidates;
  // Selected
  int? categoryId;
  int? locationId;
  int? skillId;
  String? selectedDatePosted;
  List<String> selectedEducationLevels = [];
  List<String> selectedExperiences = [];

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
  Map<String, String> educationLevels = {
    'certificate': 'Certificate',
    'diploma': 'Diploma',
    'associate': 'Associate Degree',
    'bachelor': 'Bachelor Degree',
    'master': 'Master’s Degree',
    'professional': 'Professional’s Degree',
  };
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      candidates = CandidatesProvider.listenFalse(context);
      allCategories = candidates.candidateModel!.listCategories!;
      locations = candidates.candidateModel!.listLocations!;
      skills = candidates.candidateModel!.listSkills!;
      if (candidates.candidateFilters != null) {
        locationId = candidates.candidateFilters!.location;
        categoryId = candidates.candidateFilters!.category;
        skillId = candidates.candidateFilters!.skill;
        selectedDatePosted = candidates.candidateFilters!.datePosted;
        selectedExperiences = candidates.candidateFilters!.experiences ?? [];
        selectedEducationLevels =
            candidates.candidateFilters!.educationLevels ?? [];
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
                                  text: 'Category',
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
                              hint: 'Category',
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
                                  text: 'Skills',
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
                              hint: 'Skills',
                              items:
                                  skills!.map((e) => e.name!).toSet().toList(),
                              initialValue: skills!
                                  .firstWhere(
                                    (item) => item.id == skillId,
                                    orElse: () => ListSkills(),
                                  )
                                  .name,
                              onChanged: (value) {
                                skillId = skills!
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
                                  text: 'Education Levels',
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
                                educationLevels.keys.toList().length,
                                (i) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedEducationLevels.contains(
                                          educationLevels.keys.toList()[i])) {
                                        selectedEducationLevels.remove(
                                            educationLevels.keys.toList()[i]);
                                      } else {
                                        selectedEducationLevels.add(
                                            educationLevels.keys.toList()[i]);
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
                                        color: selectedEducationLevels.contains(
                                                educationLevels.keys
                                                    .toList()[i])
                                            ? AppColors.yPrimaryColor
                                            : const Color(0xffCBC9D4)
                                                .withOpacity(0.2)),
                                    child: MainText(
                                      text: educationLevels.values.toList()[i],
                                      font: 16,
                                      weight: FontWeight.w400,
                                      color: selectedEducationLevels.contains(
                                              educationLevels.keys.toList()[i])
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
                                    candidates.candidateFilters = null;
                                    locationId = null;
                                    categoryId = null;
                                    selectedEducationLevels = [];
                                    selectedDatePosted = null;
                                    selectedExperiences = [];
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
                                  candidates.candidateFilters =
                                      CandidateFilters(
                                    location: locationId,
                                    category: categoryId,
                                    skill: skillId,
                                    educationLevels: selectedEducationLevels,
                                    datePosted: selectedDatePosted,
                                    experiences: selectedExperiences,
                                  );
                                  print(candidates.candidateFilters!.toStr());
                                  AppRoutes.pop(context);
                                  candidates.candidates(retry: true);
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
