import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/applied_jobs_model.dart';
import 'package:kafaat/providers/candidate/applied_jobs_provider.dart';
import 'package:kafaat/view/widgets/data_cell_widget.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

List<DataCell> dataRow(Job job, BuildContext context,
    {void Function()? onTap}) {
  final appliedJobs = AppliedJobsProvider.get(context);
  return [
    DataCell(
      DataCellWidget(
        child: MainText(
          text: job.jobInfo!.title,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: job.createdAt!
              .substring(0, 10)
              .replaceAllMapped('-', (match) => '/'),
          font: 13,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: job.status,
          color: const Color(0xff21B573),
          font: 14,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      appliedJobs.changeStatusStatus == DataStatus.loading &&
              appliedJobs.i == job.id
          ? const LoadingWidget(size: 20)
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: DropMenu(
                hint: 'Actions',
                fillColor: AppColors.yPrimaryColor,
                color: AppColors.yWhiteColor,
                items: const ['Approved', 'Rejected', 'Delete'],
                initialValue: null,
                onChanged: (value) async {
                  await appliedJobs.changeStatus(job.id!, value!.toLowerCase(),
                      retry: true);
                },
              ),
            ),
    ),
  ];
}
