import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/applied_jobs_model.dart';
import 'package:kafaat/providers/candidate/applied_jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/applied_jobs/widgets/applied_jobs_data_row.dart';
import 'package:kafaat/view/widgets/custom_data_column.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({
    super.key,
  });

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  final ScrollController _controllerOne = ScrollController();
  final ScrollController _controllerTwo = ScrollController();
  String? keyword = '';
  // List<DataColumn> dataColumn =;

 
  List<String> stutus = [
    'All Status',
    'Approved',
    'Pending',
    'Rejected',
  ];
  String? selectedStatus;

  List<String> orders = [
    'Title',
    'Date',
    'Status',
  ];
  String? selectedOrder;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      AppliedJobsProvider.listenFalse(context).getAllAppliedJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appliedJobs = AppliedJobsProvider.get(context);
    List<Job> jobs = [];
    if (appliedJobs.appliedJobsModel != null) {
      jobs = appliedJobs.appliedJobsModel!.jobs ?? [];
      if (selectedStatus != null && selectedStatus != 'All Status') {
        jobs = jobs
            .where(
                (j) => j.status?.toLowerCase() == selectedStatus?.toLowerCase())
            .toList();
      }
      if (selectedOrder != null) {
        if (selectedOrder == 'Title') {
          jobs.sort((a, b) => (a.jobInfo?.title ?? '')
              .toLowerCase()
              .compareTo((b.jobInfo?.title ?? '').toLowerCase()));
        } else if (selectedOrder == 'Date') {
          jobs.sort((a, b) => (a.createdAt ?? '').compareTo(b.createdAt ?? ''));
        } else if (selectedOrder == 'Status') {
          jobs.sort((a, b) => (a.status ?? '').compareTo(b.status ?? ''));
        }
      }
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: MainTextField(
              hint: 'Search by job name',
              prefixPath: 'search_icon',
              onChanged: (value) async {
                setState(() {
                  keyword = value;
                });
                if (value!.isEmpty) {
                  await appliedJobs.getAllAppliedJobs(withLoading: false);
                }
              },
              suffixIcon: GestureDetector(
                onTap: () async {
                  await appliedJobs.getAllAppliedJobs(
                      keyword: keyword, withLoading: false, retry: true);
                },
                child: Container(
                  height: 35,
                  width: 65,
                  margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.yPrimaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: FittedBox(
                      child: MainText(
                        text: 'Search',
                        color: Colors.white,
                        font: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: DropMenu(
                    hint: 'All Status',
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                    initialValue: stutus[0],
                    items: stutus,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropMenu(
                    hint: 'Order By',
                    onChanged: (value) {
                      setState(() {
                        selectedOrder = value;
                      });
                    },
                    items: orders,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: appliedJobs.appliedJobsStatus == DataStatus.loading
                ? const LoadingWidget()
                : (appliedJobs.appliedJobsStatus == DataStatus.successed &&
                        appliedJobs.appliedJobsModel != null)
                    ? Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Scrollbar(
                            controller: _controllerOne,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              controller: _controllerOne,
                              child: Scrollbar(
                                controller: _controllerTwo,
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
                                      columns: [
                                        customDataColumn('Job Title'),
                                        customDataColumn('Date Applied'),
                                        customDataColumn('Status'),
                                        customDataColumn('Actions'),
                                      ],
                                      rows: List.generate(
                                        jobs.length,
                                        (i) => DataRow(
                                          cells: dataRow(jobs[i], context),
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
