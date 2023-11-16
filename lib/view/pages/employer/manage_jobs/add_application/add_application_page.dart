import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/create_applications_model.dart';
import 'package:kafaat/providers/employer/add_new_applicant_provider.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class AddApplicationPage extends StatefulWidget {
  const AddApplicationPage({Key? key}) : super(key: key);

  @override
  State<AddApplicationPage> createState() => _AddApplicationPageState();
}

class _AddApplicationPageState extends State<AddApplicationPage> {
  List<String> status = [
    'Pending',
    'Approved',
    'Rejected',
  ];

  int _groupValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      AddNewApplicantProvider.listenFalse(context).getAllData();
    });
  }

  File? cvFile;
  double? cvSize;
  String? modificationTime;
  @override
  Widget build(BuildContext context) {
    final addNewApplicant = AddNewApplicantProvider.get(context);
    return Scaffold(
        body: Column(
      children: [
        const MainAppBar(title: 'Add New Applicant'),
        Expanded(
          child: addNewApplicant.createApplicantDataStatus ==
                  DataStatus.successed
              ? Builder(builder: (context) {
                  List<Candidate> candidates =
                      addNewApplicant.createApplicantModel!.candidates!;
                  List<Job> jobs = addNewApplicant.createApplicantModel!.jobs!;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainText(
                          text: 'Candidate Info',
                          font: 18,
                          weight: FontWeight.w600,
                          color: AppColors.yTitleColor,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MainText(
                              text: 'Candidate',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            DropMenu(
                              hint: 'Select Candidate',
                              items: candidates
                                  .map((e) => e.title!)
                                  .toSet()
                                  .toList(),
                              onChanged: (value) {
                                addNewApplicant.candidateId = candidates
                                    .firstWhere((e) => e.title == value)
                                    .id!;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const MainText(
                          text: 'Job Info',
                          font: 18,
                          weight: FontWeight.w600,
                          color: AppColors.yTitleColor,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MainText(
                              text: 'Job',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            DropMenu(
                              hint: 'Select Job',
                              items: jobs.map((e) => e.title!).toSet().toList(),
                              onChanged: (value) {
                                addNewApplicant.jobId = jobs
                                    .firstWhere((e) => e.title == value)
                                    .id!;
                              },
                            ),
                            const SizedBox(height: 20),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: DottedBorder(
                                dashPattern: const [1, 3],
                                strokeWidth: 2,
                                radius: const Radius.circular(16),
                                color: const Color(0xff9D97B5),
                                child: cvFile != null
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 16),
                                        height: addNewApplicant
                                                    .addNewApplicantStatus ==
                                                DataStatus.successed
                                            ? 100
                                            : 150,
                                        color: AppColors.yPrimaryColor
                                            .withOpacity(0.2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  getAsset('pdf_icon'),
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      MainText(
                                                        text: cvFile!.path
                                                            .split('/')
                                                            .last,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        color: AppColors
                                                            .yTitleColor,
                                                        font: 16,
                                                        weight: FontWeight.w500,
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      Row(
                                                        children: [
                                                          MainText(
                                                            text: cvSize != null
                                                                ? '${cvSize!.toStringAsFixed(2)} KB'
                                                                : '0 KB',
                                                            maxLines: 1,
                                                            color: AppColors
                                                                .yBodyColor,
                                                            font: 14,
                                                            weight:
                                                                FontWeight.w400,
                                                          ),
                                                          const SizedBox(
                                                              width: 16),
                                                          MainText(
                                                            text: modificationTime !=
                                                                    null
                                                                ? modificationTime!
                                                                    .substring(
                                                                        0, 16)
                                                                : '',
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            color: AppColors
                                                                .yBodyColor,
                                                            font: 14,
                                                            weight:
                                                                FontWeight.w400,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            addNewApplicant
                                                        .addNewApplicantStatus ==
                                                    DataStatus.successed
                                                ? const SizedBox()
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        cvFile = null;
                                                        cvSize = null;
                                                        modificationTime = null;
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          getAsset(
                                                              'delete_icon'),
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        const MainText(
                                                          text: 'Remove file',
                                                          color: AppColors
                                                              .yPrimaryColor,
                                                          font: 13,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                          ],
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () async {
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles();
                                          if (result != null) {
                                            cvFile =
                                                File(result.files.single.path!);

                                            await cvFile!.length().then(
                                                (value) =>
                                                    cvSize = value / 1024);
                                            await cvFile!.lastModified().then(
                                                (value) => modificationTime =
                                                    value.toString());
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 80,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  getAsset('upload_icon'),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(width: 20),
                                                const MainText(
                                                  text: 'Upload CV/Resume',
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
                            const SizedBox(height: 16),
                            const MainText(
                              text: 'Message',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Write Message Here',
                              minLines: 6,
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewApplicant.content = value;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const MainText(
                          text: 'Status',
                          font: 18,
                          weight: FontWeight.w600,
                          color: AppColors.yTitleColor,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              status.length,
                              (i) => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MainText(
                                        text: status[i],
                                        font: 16,
                                        weight: FontWeight.w400,
                                        color: AppColors.yDisableTabColor,
                                      ),
                                      Radio(
                                          value: i,
                                          groupValue: _groupValue,
                                          activeColor: AppColors.yPrimaryColor,
                                          onChanged: (int? i) {
                                            setState(() {
                                              _groupValue = i!;
                                              addNewApplicant.status =
                                                  status[i];
                                            });
                                          }),
                                    ],
                                  )),
                        ),
                        const SizedBox(height: 40),
                        MainButton(
                          title: 'Save Changes',
                          onPressed: () async {
                            if (cvFile != null) {
                              await addNewApplicant.addNewApplicant(cvFile!);
                            } else {
                              showSnackbar('Please Select CV File!',
                                  error: true);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                })
              : const SizedBox(),
        ),
      ],
    ));
  }
}
