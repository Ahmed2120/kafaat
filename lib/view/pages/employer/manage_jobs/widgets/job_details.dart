import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/manage_jobs_model.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/upload_cv.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/map_widget.dart';
import 'package:kafaat/view/widgets/retry_widget.dart';

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  bool readMore = false;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () async {
  //     JobsProvider.listenFalse(context).jobDetails(slugId: widget.slugId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final jobs = JobsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(),
          Expanded(
            child: Builder(
              builder: (context) {
                String jobDes =
                    convertHtmlToPlainText(widget.job.content! ?? '')
                        .replaceAll(RegExp(r'\n\n'), '\n');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            height: 120,
                            decoration: BoxDecoration(
                                color:
                                    AppColors.yPrimaryColor.withOpacity(0.2)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                getAsset('apple_icon'),
                                height: 70,
                                width: 70,
                              ),
                              const SizedBox(height: 10),
                              MainText(
                                text: widget.job.title ?? '',
                                font: 16,
                                weight: FontWeight.w700,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainText(
                                      text: widget.job.company?.name ?? '',
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
                                      text: widget.job.location?.name ?? '',
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
                                      text: widget.job.createdAt
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
                              horizontal: 12, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Chip(
                                      label: FittedBox(
                                        child: MainText(
                                          text:
                                              '${widget.job.salaryMin ?? ''} - ${widget.job.salaryMax}/${widget.job.salaryType}',
                                          font: 14,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Chip(
                                      label: FittedBox(
                                        child: MainText(
                                          text: widget.job.category?.name ?? '',
                                          font: 14,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              const MainText(
                                text: 'Job Description',
                                font: 16,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(height: 12),
                              MainText(
                                text: jobDes,
                                // .split('Job Description')[1]
                                // .split('Key Responsibilities')[0]
                                // .trim(),
                                textAlign: TextAlign.start,
                                font: 12,
                                weight: FontWeight.w500,
                                color: AppColors.yGreyBlckColor,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MainButton(
                                    onPressed: () {
                                      setState(() {
                                        readMore = !readMore;
                                      });
                                    },
                                    title: readMore ? 'Read Less' : 'Read More',
                                    borerRadius: 6,
                                    horizontalPadding: 20,
                                    color: AppColors.yPrimaryColor
                                        .withOpacity(0.2),
                                    textColor: AppColors.yMainColor,
                                    font: 13,
                                    weight: FontWeight.w400,
                                    verticalPadding: 10,
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 30),
                              // const MainText(
                              //   text: 'Requirements',
                              //   font: 16,
                              //   weight: FontWeight.w600,
                              // ),
                              // const SizedBox(height: 12),
                              // MainText(
                              //   text: jobDes,
                              //       // .split('Key Responsibilities')[1]
                              //       // .split('Skill & Experience')[0]
                              //       // .trim(),
                              //   textAlign: TextAlign.start,
                              //   font: 12,
                              //   weight: FontWeight.w500,
                              //   color: AppColors.yGreyBlckColor,
                              // ),
                              // const SizedBox(height: 30),
                              // const MainText(
                              //   text: 'Skill & Experience',
                              //   font: 16,
                              //   weight: FontWeight.w600,
                              // ),
                              // const SizedBox(height: 12),
                              // MainText(
                              //   text: jobDes
                              //       .split('Skill & Experience')[1]
                              //       .trim(),
                              //   textAlign: TextAlign.start,
                              //   font: 12,
                              //   weight: FontWeight.w500,
                              //   color: AppColors.yGreyBlckColor,
                              // ),
                              const SizedBox(height: 12),
                              readMore
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 30),
                                        const MainText(
                                          text: 'Location',
                                          font: 16,
                                          weight: FontWeight.w600,
                                        ),
                                        const SizedBox(height: 12),
                                        MainText(
                                          text: widget.job.location?.name ?? '',
                                          font: 14,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 12),
                                        MapWidget(
                                          width: context.width,
                                          height: 200,
                                          lat: doubleOf(
                                              widget.job.location?.mapLat),
                                          long: doubleOf(
                                              widget.job.location?.mapLng),
                                        ),
                                        const SizedBox(height: 30),
                                        const MainText(
                                          text: 'Informations',
                                          font: 16,
                                          weight: FontWeight.w600,
                                        ),
                                        const SizedBox(height: 12),
                                        const MainText(
                                          text: 'Position',
                                          font: 14,
                                          weight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 8),
                                        MainText(
                                          text: widget.job.company?.name ?? '',
                                          font: 13,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 12),
                                        const Divider(),
                                        const SizedBox(height: 12),
                                        const MainText(
                                          text: 'Qualification',
                                          font: 14,
                                          weight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 8),
                                        const MainText(
                                          text: 'Bachelor’s Degree',
                                          font: 13,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 12),
                                        const Divider(),
                                        const SizedBox(height: 12),
                                        const MainText(
                                          text: 'Experience',
                                          font: 14,
                                          weight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 8),
                                        if (widget.job.experience != null)
                                          MainText(
                                            text:
                                                '${widget.job.experience?.toString() ?? ''} Years',
                                            font: 13,
                                            weight: FontWeight.w400,
                                          ),
                                        // const SizedBox(height: 12),
                                        // const Divider(),
                                        // const SizedBox(height: 12),
                                        // const MainText(
                                        //   text: 'Job Type',
                                        //   font: 14,
                                        //   weight: FontWeight.w700,
                                        // ),
                                        // const SizedBox(height: 8),
                                        // MainText(
                                        //   text: widget.job.jobTypeId.jobType
                                        //           ?.name ??
                                        //       '',
                                        //   font: 13,
                                        //   weight: FontWeight.w400,
                                        // ),
                                        const SizedBox(height: 12),
                                        const Divider(),
                                        const SizedBox(height: 12),
                                        const MainText(
                                          text: 'Specialization',
                                          font: 14,
                                          weight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 8),
                                        MainText(
                                          text: widget.job.category?.name,
                                          font: 13,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 30),
                                        // const MainText(
                                        //   text: 'Facilities and Others',
                                        //   font: 16,
                                        //   weight: FontWeight.w600,
                                        // ),
                                        // const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Medical',
                                        //         textAlign: TextAlign.start,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Dental',
                                        //         textAlign: TextAlign.start,
                                        //         maxLines: 2,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Technical Cartification',
                                        //         textAlign: TextAlign.start,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Meal Allowance',
                                        //         textAlign: TextAlign.start,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Transport Allowance',
                                        //         textAlign: TextAlign.start,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   const SizedBox(height: 12),
                                        //   Row(
                                        //     children: [
                                        //       Container(
                                        //         decoration: const BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             color:
                                        //                 AppColors.yMainColor),
                                        //         height: 6,
                                        //         width: 6,
                                        //       ),
                                        //       const SizedBox(width: 8),
                                        //       const MainText(
                                        //         text: 'Regular Hours',
                                        //         textAlign: TextAlign.start,
                                        //         font: 13,
                                        //         weight: FontWeight.w400,
                                        //       ),
                                        //     ],
                                        //   ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // MainButton(
                      //   title: 'Apply Now',
                      //   horizontalMargin: 40,
                      //   onPressed: () {
                      //     AppRoutes.routeTo(
                      //         context, UploadCVPage(slugId: widget.slugId));
                      //   },
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
