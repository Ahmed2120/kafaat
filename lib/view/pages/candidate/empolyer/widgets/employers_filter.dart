import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/models/employers_model.dart';
import 'package:kafaat/providers/candidate/employers_provider.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EmployersFiltersPage extends StatefulWidget {
  const EmployersFiltersPage({Key? key}) : super(key: key);

  @override
  State<EmployersFiltersPage> createState() => _EmployersFiltersPageState();
}

class _EmployersFiltersPageState extends State<EmployersFiltersPage> {
  double fromDate = DateTime.now().year - 20;
  double toDate = DateTime.now().year + 10;
  late SfRangeValues salaryRange;
  List<Categories>? allCategories;
  List<ListLocations>? locations;
  late final EmployersProvider employers;
  // Selected
  int? categoryId;
  int? locationId;
  String? selectedDatePosted;
  List<String> selectedCompanySize = [];
  late SfRangeValues salaryFromTo;

  Map<String, String> companySizes = {
    '1': '10-50 Members',
    '2': '50-100 Members',
    '3': '100-200 Members',
    '4': '200-500 Members',
    '5': '500-1000 Members',
    '6': '1000-10000 Members',
  };
  Map<String, String> datePosted = {
    'all': 'All',
    'last_hour': 'Last Hour',
    'last_1': 'Last 24 Hours',
    'last_7': 'Last 7 Days',
    'last_14': 'Last 14 Days',
    'last_30': 'Last 30 Days'
  };
  @override
  void initState() {
    salaryRange = SfRangeValues(fromDate, toDate);
    salaryFromTo = SfRangeValues(fromDate, toDate);
    super.initState();
    Future.delayed(Duration.zero, () async {
      employers = EmployersProvider.listenFalse(context);
      allCategories = employers.employerModel!.categories!;
      locations = employers.employerModel!.listLocations!;
      if (employers.employerFilters != null) {
        locationId = employers.employerFilters!.location;
        categoryId = employers.employerFilters!.category;
        // selectedEmployerTypes = employers.employerFilters!.employerTypes ?? [];
        selectedDatePosted = employers.employerFilters!.datePosted;
        selectedCompanySize = employers.employerFilters!.companySize ?? [];
        salaryFromTo = SfRangeValues(
            employers.employerFilters!.fromDate ?? fromDate,
            employers.employerFilters!.toDate ?? toDate);
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
                                    orElse: () => Categories(),
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
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         const MainText(
                        //           text: 'Last Update',
                        //           font: 15,
                        //           weight: FontWeight.w600,
                        //         ),
                        //         Image.asset(
                        //           getAsset('arrow_down'),
                        //           height: 14,
                        //           width: 14,
                        //         )
                        //       ],
                        //     ),
                        //     const SizedBox(height: 10),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: List.generate(
                        //         datePosted.keys.toList().length,
                        //         (i) => InkWell(
                        //           onTap: () {
                        //             setState(() {
                        //               selectedDatePosted =
                        //                   datePosted.keys.toList()[i];
                        //             });
                        //           },
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Radio<String>(
                        //                 value: datePosted.keys.toList()[i],
                        //                 groupValue: selectedDatePosted,
                        //                 activeColor: AppColors.yPrimaryColor,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     selectedDatePosted = value;
                        //                   });
                        //                 },
                        //               ),
                        //               const SizedBox(width: 4),
                        //               MainText(
                        //                 text: datePosted.values.toList()[i],
                        //                 font: 16,
                        //                 weight: FontWeight.w400,
                        //                 color: AppColors.yMainColor,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(height: 10),
                        // const Divider(),
                        // const SizedBox(height: 10),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         const MainText(
                        //           text: 'Employer Type',
                        //           font: 15,
                        //           weight: FontWeight.w600,
                        //         ),
                        //         Image.asset(
                        //           getAsset('arrow_down'),
                        //           height: 14,
                        //           width: 14,
                        //         )
                        //       ],
                        //     ),
                        //     const SizedBox(height: 20),
                        //     Wrap(
                        //       children: List.generate(
                        //         employerTypes.keys.toList().length,
                        //         (i) => GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               if (selectedEmployerTypes.contains(
                        //                   employerTypes.keys.toList()[i])) {
                        //                 selectedEmployerTypes
                        //                     .remove(employerTypes.keys.toList()[i]);
                        //               } else {
                        //                 selectedEmployerTypes
                        //                     .add(employerTypes.keys.toList()[i]);
                        //               }
                        //             });
                        //           },
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 10, vertical: 8),
                        //             margin: const EdgeInsets.only(
                        //                 right: 20, bottom: 10),
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(8),
                        //                 color: selectedEmployerTypes.contains(
                        //                         employerTypes.keys.toList()[i])
                        //                     ? AppColors.yPrimaryColor
                        //                     : const Color(0xffCBC9D4)
                        //                         .withOpacity(0.2)),
                        //             child: MainText(
                        //               text: employerTypes.values.toList()[i],
                        //               font: 16,
                        //               weight: FontWeight.w400,
                        //               color: selectedEmployerTypes.contains(
                        //                       employerTypes.keys.toList()[i])
                        //                   ? AppColors.yWhiteColor
                        //                   : const Color(0xff524B6B),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(height: 10),
                        // const Divider(),
                        // const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MainText(
                                  text: 'Founded Date',
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
                              stepSize: 1,
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
                                companySizes.keys.toList().length,
                                (i) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: MainCheckbox(
                                    value: selectedCompanySize.contains(
                                        companySizes.keys.toList()[i]),
                                    onChanged: (value) {
                                      setState(() {
                                        if (value) {
                                          selectedCompanySize.add(
                                              companySizes.keys.toList()[i]);
                                        } else {
                                          selectedCompanySize.remove(
                                              companySizes.keys.toList()[i]);
                                        }
                                      });
                                    },
                                    textColor: AppColors.yBlackColor,
                                    content: companySizes.values.toList()[i],
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
                                    employers.employerFilters = null;
                                    locationId = null;
                                    categoryId = null;
                                    selectedDatePosted = null;
                                    selectedCompanySize = [];
                                    salaryFromTo =
                                        SfRangeValues(fromDate, toDate);
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
                                  employers.employerFilters = EmployerFilters(
                                    keyword: employers.employerFilters?.keyword,
                                    location: locationId,
                                    category: categoryId,
                                    datePosted: selectedDatePosted,
                                    companySize: selectedCompanySize,
                                    fromDate: salaryFromTo.start,
                                    toDate: salaryFromTo.end,
                                  );
                                  print(employers.employerFilters!.toStr());
                                  AppRoutes.pop(context);
                                  employers.employers(retry: true);
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
