import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/cv_model.dart';
import 'package:kafaat/providers/candidate/cv_manager_provider.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:open_file/open_file.dart';

class CVManagerItem extends StatelessWidget {
  const CVManagerItem({Key? key, required this.cv}) : super(key: key);
  final Cv cv;

  @override
  Widget build(BuildContext context) {
    final cvManager = CVManagerProvider.get(context);
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(bottom: 15, right: 4, left: 4, top: 10),
          child: InkWell(
            onTap: () async {
              await cvManager.setCVDefault(cv.id!);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppColors.yWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.yBlackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainText(
                        text: cv.media?.fileName ?? 'CV #${cv.id ?? ''}',
                        font: 16,
                        weight: FontWeight.bold,
                      ),
                      (cvManager.currentId == cv.id &&
                              cvManager.deleteCVStatus == DataStatus.loading)
                          ? const LoadingWidget(size: 15)
                          : InkWell(
                              onTap: () async {
                                if (cv.id != null) {
                                  await cvManager.deleteCV(cv.id!);
                                }
                              },
                              child: Image.asset(
                                getAsset('delete_icon'),
                                height: 24,
                                width: 24,
                              ),
                            )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(getAsset('pdf_icon'), height: 45, width: 45),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              text: '${cv.createdAt}'.substring(0, 10),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              font: 14,
                              color: AppColors.yDarkColor,
                              weight: FontWeight.w500,
                            ),
                            const SizedBox(height: 4),
                            MainText(
                              text:
                                  '${(cv.media?.fileSize.toString().toDoubleNum ?? 0) ~/ 1024} Kb',
                              font: 14,
                              color: AppColors.yBodyColor,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      (cvManager.currentFileName == cv.media?.fileName &&
                              cvManager.downloadCVStatus == DataStatus.loading)
                          ? const LoadingWidget(size: 15)
                          : FutureBuilder(
                              future: cvManager.checkPath(
                                  cv.media?.filePath?.split('/').last),
                              builder: (context, snapshot) {
                                return (snapshot.hasData && snapshot.data!)
                                    ? InkWell(
                                        onTap: () async {
                                          String f = await cvManager.getPath();
                                          await OpenFile.open(
                                              '$f/${cv.media!.filePath!.split('/').last}');
                                        },
                                        child: const Icon(
                                          Icons.file_open,
                                          color: Colors.orange,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () async {
                                          if (cv.media?.filePath != null) {
                                            await cvManager.download(
                                                'https://al-kafaat.com/uploads/${cv.media!.filePath}',
                                                cv.media?.fileName);
                                          }
                                        },
                                        child: const Icon(
                                          Icons.download_rounded,
                                          color: Colors.green,
                                        ),
                                      );
                              }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (cv.isDefault == 1) ...{
          const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.yGreenColor,
            child: Icon(
              Icons.task_alt_rounded,
              color: Colors.white,
              size: 25,
            ),
          )
        },
      ],
    );
  }
}
