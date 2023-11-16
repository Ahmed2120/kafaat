import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/applications_model.dart';
import 'package:kafaat/providers/employer/application_provider.dart';
import 'package:kafaat/view/widgets/data_cell_widget.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

List<DataCell> dataRow(Application application, BuildContext context,
    {void Function()? onTap}) {
  final applications = ApplicationProvider.get(context);
  return [
    DataCell(
      DataCellWidget(
        child: MainText(
          text: application.candidateInfo!.title,
          font: 14,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: application.jobInfo!.title,
          font: 12,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        fromStart: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              getAsset('pdf_icon'),
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 6),
            MainText(
              text: application.cvInfo?.media?.fileName ?? '',
              maxLines: 1,
              font: 13,
              weight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
    DataCell(
      DataCellWidget(
        child: MainText(
          text: application.createdAt!
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
          text: application.status,
          color: const Color(0xff21B573),
          font: 14,
          weight: FontWeight.w400,
        ),
      ),
    ),
    DataCell(
      applications.changeStatusStatus == DataStatus.loading &&
              applications.i == application.id
          ? const LoadingWidget(size: 20)
          : Padding(
              padding: const EdgeInsets.all(2),
              child: DropMenu(
                hint: 'Actions',
                fillColor: AppColors.yPrimaryColor,
                color: AppColors.yWhiteColor,
                items: const ['Approved', 'Rejected', 'Delete'],
                initialValue: null,
                onChanged: (value) async {
                  await applications.changeStatus(
                      application.id!, value!.toLowerCase(),
                      retry: true);
                },
              ),
            ),
      // DataCellWidget(
      //   onTap: onTap,
      //   color: AppColors.yPrimaryColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const MainText(
      //         text: 'Actions',
      //         font: 14,
      //         color: AppColors.yWhiteColor,
      //         weight: FontWeight.w400,
      //       ),
      //       const SizedBox(width: 6),
      //       Image.asset(
      //         getAsset('down_arrow'),
      //         height: 12,
      //         width: 12,
      //       )
      //     ],
      //   ),
      // ),
    ),
  ];
}
