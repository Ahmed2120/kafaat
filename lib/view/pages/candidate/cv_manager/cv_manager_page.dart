import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/cv_manager_provider.dart';
import 'package:kafaat/view/pages/candidate/cv_manager/widgets/cv_manager_item.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class CVManagerPage extends StatefulWidget {
  const CVManagerPage({super.key});

  @override
  State<CVManagerPage> createState() => _CVManagerPageState();
}

class _CVManagerPageState extends State<CVManagerPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      CVManagerProvider.listenFalse(context).cvManager();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cvManager = CVManagerProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'CV Manager'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainText(
                    text: 'CV',
                    font: 15,
                    weight: FontWeight.w600,
                    color: AppColors.yMainColor,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        setState(() {
                          cvManager.cvFile = File(file.path!);
                        });
                      } else {
                        // User canceled the file picking
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: DottedBorder(
                        dashPattern: const [1, 3],
                        strokeWidth: 2,
                        color: const Color(0xff9D97B5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 80,
                          child: Center(
                            child: cvManager.cvFile != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        getAsset('upload_icon'),
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: MainText(
                                          text: cvManager.cvFile!.path,
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          color: AppColors.yTitleColor,
                                          font: 14,
                                          weight: FontWeight.w400,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            await cvManager.uploadCV();
                                          },
                                          icon: const Icon(
                                            Icons.upload_rounded,
                                            color: AppColors.yPrimaryColor,
                                          ))
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        getAsset('upload_icon'),
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(width: 20),
                                      const MainText(
                                        text: 'Upload CV ',
                                        color: AppColors.yTitleColor,
                                        font: 14,
                                        weight: FontWeight.w400,
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: cvManager.cvManagerStatus == DataStatus.successed
                        ? cvManager.cvManagerModel != null
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    CVManagerItem(
                                  cv: cvManager.cvManagerModel!.cv!.cvs![i],
                                ),
                                itemCount:
                                    cvManager.cvManagerModel?.cv?.cvs?.length ??
                                        0,
                              )
                            : const SizedBox()
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
