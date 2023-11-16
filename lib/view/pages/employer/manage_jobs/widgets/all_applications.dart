import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/application_provider.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/widgets/application_data_row.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class AllApplicationsPage extends StatefulWidget {
  const AllApplicationsPage({
    super.key,
  });

  @override
  State<AllApplicationsPage> createState() => _AllApplicationsPageState();
}

class _AllApplicationsPageState extends State<AllApplicationsPage> {
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();
  List<DataColumn> dataColumn = [
    DataColumn(
        label: Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.yPrimaryColor.withOpacity(0.24),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: MainText(
                text: 'Candidate',
                color: AppColors.yPrimaryColor,
                font: 15,
                weight: FontWeight.w500,
              ),
            ))),
    DataColumn(
        label: Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.yPrimaryColor.withOpacity(0.24),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: MainText(
                text: 'Job Title',
                color: AppColors.yPrimaryColor,
                font: 15,
                weight: FontWeight.w500,
              ),
            ))),
    DataColumn(
        label: Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.yPrimaryColor.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
        child: MainText(
          text: 'CV',
          color: AppColors.yPrimaryColor,
          font: 15,
          weight: FontWeight.w500,
        ),
      ),
    )),
    DataColumn(
        label: Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.yPrimaryColor.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
        child: MainText(
          text: 'Date Applied',
          color: AppColors.yPrimaryColor,
          font: 15,
          weight: FontWeight.w500,
        ),
      ),
    )),
    DataColumn(
        label: Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.yPrimaryColor.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
        child: MainText(
          text: 'Status',
          color: AppColors.yPrimaryColor,
          font: 15,
          weight: FontWeight.w500,
        ),
      ),
    )),
    DataColumn(
        label: Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.yPrimaryColor.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Center(
        child: MainText(
          text: 'Actions',
          color: AppColors.yPrimaryColor,
          font: 15,
          weight: FontWeight.w500,
        ),
      ),
    )),
  ];
  List<String> data = [
    'Data 1',
    'Data 2',
    'Data 3',
  ];

  @override
  void initState() {
    super.initState();
    ApplicationProvider.listenFalse(context).getAllApplication();
  }

  @override
  Widget build(BuildContext context) {
    final applications = ApplicationProvider.get(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: DropMenu(
          //           hint: 'Select Job',
          //           onChanged: (String? v) {},
          //           items: data,
          //         ),
          //       ),
          //       const SizedBox(width: 10),
          //       MainButton(
          //         height: 50,
          //         title: 'Export',
          //         horizontalPadding: 16,
          //         verticalPadding: 0,
          //         color: AppColors.ySecondaryColor,
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 32),
          Expanded(
            child: applications.applicationStatus == DataStatus.loading
                ? const LoadingWidget()
                : applications.applicationStatus == DataStatus.successed
                    ? Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Scrollbar(
                            // isAlwaysShown: false,
                            controller: _controllerOne,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              controller: _controllerOne,
                              child: Scrollbar(
                                controller: _controllerTwo,
                                // isAlwaysShown: false,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _controllerTwo,
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: DataTable(
                                      horizontalMargin: 4,
                                      columnSpacing: 20,
                                      showBottomBorder: false,
                                      dividerThickness: 0,
                                      columns: dataColumn,
                                      rows: List.generate(
                                        applications.applicationModel!
                                            .applications!.length,
                                        (i) => DataRow(
                                          cells: dataRow(
                                              applications.applicationModel!
                                                  .applications![i],
                                              context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
