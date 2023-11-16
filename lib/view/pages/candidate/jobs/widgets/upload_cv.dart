import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/candidate/jobs/jobs_page.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/retry_widget.dart';
import 'package:kafaat/view/widgets/success_widget.dart';

class UploadCVPage extends StatefulWidget {
  const UploadCVPage({
    Key? key,
    required this.slugId,
  }) : super(key: key);

  final String slugId;

  @override
  State<UploadCVPage> createState() => _UploadCVPageState();
}

class _UploadCVPageState extends State<UploadCVPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      JobsProvider.listenFalse(context).jobDetails(slugId: widget.slugId);
    });
  }

  File? cvFile;
  double? cvSize;
  String? modificationTime;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Upload CV'),
          Expanded(
            child: (jobs.jobDetailsStatus == DataStatus.loading)
                ? const LoadingWidget()
                : (jobs.jobDetailsStatus == DataStatus.successed)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 40),
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: AppColors.yPrimaryColor
                                          .withOpacity(0.2)),
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      getAsset('apple_icon'),
                                      height: 70,
                                      width: 70,
                                    ),
                                    const SizedBox(height: 10),
                                    MainText(
                                      text: jobs.jobDetailsModel?.jobDetail
                                              ?.title ??
                                          '',
                                      font: 16,
                                      weight: FontWeight.w700,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MainText(
                                            text: jobs
                                                    .jobDetailsModel
                                                    ?.jobDetail
                                                    ?.company
                                                    ?.name ??
                                                '',
                                            font: 16,
                                            weight: FontWeight.w400,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.yMainColor),
                                            height: 6,
                                            width: 6,
                                          ),
                                          MainText(
                                            text: jobs
                                                    .jobDetailsModel
                                                    ?.jobDetail
                                                    ?.location
                                                    ?.name ??
                                                '',
                                            font: 16,
                                            weight: FontWeight.w400,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.yMainColor),
                                            height: 6,
                                            width: 6,
                                          ),
                                          MainText(
                                            text: jobs.jobDetailsModel
                                                    ?.jobDetail?.createdAt
                                                    ?.substring(0, 10) ??
                                                '',
                                            font: 16,
                                            weight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    jobs.applyJobStatus == DataStatus.successed
                                        ? const SizedBox()
                                        : const Column(
                                            children: [
                                              MainText(
                                                text: 'Upload CV',
                                                font: 18,
                                                weight: FontWeight.w600,
                                                color: AppColors.yTitleColor,
                                              ),
                                              SizedBox(height: 20),
                                              MainText(
                                                text:
                                                    'Add your CV/Resume to apply for a job',
                                                font: 14,
                                                weight: FontWeight.w400,
                                                color: AppColors.yMainColor,
                                              ),
                                            ],
                                          ),
                                    const SizedBox(height: 16),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: DottedBorder(
                                        dashPattern: const [1, 3],
                                        strokeWidth: 2,
                                        radius: const Radius.circular(16),
                                        color: const Color(0xff9D97B5),
                                        child: cvFile != null
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25,
                                                        vertical: 16),
                                                height: jobs.applyJobStatus ==
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
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          getAsset('pdf_icon'),
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                        const SizedBox(
                                                            width: 20),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              MainText(
                                                                text: cvFile!
                                                                    .path
                                                                    .split('/')
                                                                    .last,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                                color: AppColors
                                                                    .yTitleColor,
                                                                font: 16,
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              const SizedBox(
                                                                  height: 16),
                                                              Row(
                                                                children: [
                                                                  MainText(
                                                                    text: cvSize !=
                                                                            null
                                                                        ? '${cvSize!.toStringAsFixed(2)} KB'
                                                                        : '0 KB',
                                                                    maxLines: 1,
                                                                    color: AppColors
                                                                        .yBodyColor,
                                                                    font: 14,
                                                                    weight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          16),
                                                                  MainText(
                                                                    text: modificationTime !=
                                                                            null
                                                                        ? modificationTime!.substring(
                                                                            0,
                                                                            16)
                                                                        : '',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    color: AppColors
                                                                        .yBodyColor,
                                                                    font: 14,
                                                                    weight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    jobs.applyJobStatus ==
                                                            DataStatus.successed
                                                        ? const SizedBox()
                                                        : InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                cvFile = null;
                                                                cvSize = null;
                                                                modificationTime =
                                                                    null;
                                                              });
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                  text:
                                                                      'Remove file',
                                                                  color: AppColors
                                                                      .yPrimaryColor,
                                                                  font: 13,
                                                                  weight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () async {
                                                  final result =
                                                      await FilePicker.platform
                                                          .pickFiles();
                                                  if (result != null) {
                                                    cvFile = File(result
                                                        .files.single.path!);

                                                    await cvFile!.length().then(
                                                        (value) => cvSize =
                                                            value / 1024);
                                                    await cvFile!
                                                        .lastModified()
                                                        .then((value) =>
                                                            modificationTime =
                                                                value
                                                                    .toString());
                                                    setState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  height: 80,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          getAsset(
                                                              'upload_icon'),
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        const SizedBox(
                                                            width: 20),
                                                        const MainText(
                                                          text:
                                                              'Upload CV/Resume',
                                                          color: AppColors
                                                              .yTitleColor,
                                                          font: 14,
                                                          weight:
                                                              FontWeight.w400,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    jobs.applyJobStatus == DataStatus.successed
                                        ? const SizedBox()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const MainText(
                                                text: 'Information',
                                                font: 18,
                                                weight: FontWeight.w600,
                                                color: AppColors.yTitleColor,
                                              ),
                                              const SizedBox(height: 20),
                                              MainTextField(
                                                controller: controller,
                                                minLines: 7,
                                                hint:
                                                    'Explain why you are the right person for this job',
                                              ),
                                            ],
                                          ),
                                    const SizedBox(height: 20),
                                    jobs.applyJobStatus == DataStatus.successed
                                        ? const SizedBox()
                                        : MainButton(
                                            title: 'Apply Now',
                                            onPressed: () async {
                                              if (cvFile != null) {
                                                if (controller
                                                    .text.isNotEmpty) {
                                                  await jobs.applyJob(
                                                      cvFile!,
                                                      controller.text,
                                                      jobs.jobDetailsModel!
                                                          .jobDetail!.id!,
                                                      jobs
                                                          .jobDetailsModel!
                                                          .jobDetail!
                                                          .company!
                                                          .id!);
                                                } else {
                                                  showSnackbar(
                                                      'Please Enter Information About your Applicant',
                                                      error: true);
                                                }
                                              }
                                            },
                                          ),
                                    jobs.applyJobStatus == DataStatus.successed
                                        ? const Center(child: SuccessWidget())
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : RetryWidget(retryCallback: () {
                        jobs.jobDetails(retry: true, slugId: widget.slugId);
                      }),
          ),
          jobs.applyJobStatus == DataStatus.successed
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      MainButton(
                        title: 'Find a similar job',
                        color: AppColors.yPrimaryColor.withOpacity(0.4),
                        textColor: AppColors.yPrimaryColor,
                        onPressed: () async {
                          jobs.applyJobStatus = null;
                          AppRoutes.routeRemoveAllTo(
                              context, const CandidateHomePage());
                          AppRoutes.routeTo(context, const JobsPage());
                        },
                      ),
                      const SizedBox(height: 8),
                      MainButton(
                        title: 'Back to home',
                        onPressed: () async {
                          jobs.applyJobStatus = null;
                          AppRoutes.routeRemoveAllTo(
                              context, const CandidateHomePage());
                        },
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
