import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/helper/functions/string_to_double.dart';
import 'package:kafaat/providers/candidate/employers_provider.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/map_widget.dart';

class EmployerProfilePage extends StatefulWidget {
  const EmployerProfilePage({
    Key? key,
    required this.slug,
  }) : super(key: key);
  final String slug;

  @override
  State<EmployerProfilePage> createState() => _EmployerProfilePageState();
}

class _EmployerProfilePageState extends State<EmployerProfilePage> {
  bool readMore = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      EmployersProvider.listenFalse(context).employerDetails(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    final employers = EmployersProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: ''),
          employers.employerDetailModel != null
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 40),
                              height: 120,
                              decoration: BoxDecoration(
                                color: AppColors.yPrimaryColor.withOpacity(0.2),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      getAsset('empolyer_user'),
                                      height: 70,
                                      width: 70,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                MainText(
                                  text: employers.employerDetailModel!
                                      .employerDetails!.name,
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
                                        text: employers.employerDetailModel!
                                            .employerDetails!.category!.name,
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
                                        text: employers.employerDetailModel!
                                            .employerDetails!.location!.name,
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
                                        text: employers.employerDetailModel!
                                            .employerDetails!.foundedIn,
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
                                employers.employerDetailModel!.jobs!.jobs!
                                        .isNotEmpty
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              const MainText(
                                                text: 'Salary',
                                                font: 12,
                                                color:
                                                    AppColors.yDisableTabColor,
                                                weight: FontWeight.w400,
                                              ),
                                              const SizedBox(height: 8),
                                              MainText(
                                                text:
                                                    '${employers.employerDetailModel!.jobs!.jobs![0].salaryMin} - ${employers.employerDetailModel!.jobs!.jobs![0].salaryMax}\$ / Month',
                                                font: 14,
                                                color: AppColors.yPrimaryColor,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const MainText(
                                                text: 'Job Type',
                                                font: 12,
                                                color:
                                                    AppColors.yDisableTabColor,
                                                weight: FontWeight.w400,
                                              ),
                                              const SizedBox(height: 8),
                                              MainText(
                                                text:
                                                    '${employers.employerDetailModel!.jobs!.jobs![0].jobType!.name}',
                                                font: 14,
                                                color: AppColors.yMainColor,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const MainText(
                                                text: 'Postion',
                                                font: 12,
                                                color:
                                                    AppColors.yDisableTabColor,
                                                weight: FontWeight.w400,
                                              ),
                                              const SizedBox(height: 8),
                                              MainText(
                                                text:
                                                    '${employers.employerDetailModel!.jobs!.jobs![0].category!.name}',
                                                font: 14,
                                                color: AppColors.yPrimaryColor,
                                                weight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 30),
                                const MainText(
                                  text: 'About',
                                  font: 16,
                                  weight: FontWeight.w600,
                                ),
                                const SizedBox(height: 12),
                                MainText(
                                  text: convertHtmlToPlainText(employers
                                          .employerDetailModel!
                                          .employerDetails!
                                          .about ??
                                      ''),
                                  textAlign: TextAlign.start,
                                  font: 13,
                                  weight: FontWeight.w400,
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
                                      title:
                                          readMore ? 'Read Less' : 'Read More',
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
                                readMore
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          const MainText(
                                            text: 'Location',
                                            font: 16,
                                            weight: FontWeight.w600,
                                          ),
                                          const SizedBox(height: 12),
                                          MainText(
                                            text: employers
                                                    .employerDetailModel!
                                                    .employerDetails
                                                    ?.location
                                                    ?.name ??
                                                '',
                                            font: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          const SizedBox(height: 12),
                                          MapWidget(
                                            width: context.width,
                                            height: 200,
                                            lat: doubleOf(employers
                                                .employerDetailModel!
                                                .employerDetails
                                                ?.location
                                                ?.mapLat),
                                            long: doubleOf(employers
                                                .employerDetailModel!
                                                .employerDetails
                                                ?.location
                                                ?.mapLng),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 20),
                                const MainText(
                                  text: 'Website',
                                  font: 16,
                                  weight: FontWeight.w600,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.yMainColor),
                                      height: 6,
                                      width: 6,
                                    ),
                                    const SizedBox(width: 8),
                                    MainText(
                                      text: employers.employerDetailModel!
                                          .employerDetails!.website,
                                      textAlign: TextAlign.start,
                                      font: 13,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                const MainText(
                                  text: 'Email',
                                  font: 16,
                                  weight: FontWeight.w600,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.yMainColor),
                                      height: 6,
                                      width: 6,
                                    ),
                                    const SizedBox(width: 8),
                                    MainText(
                                      text: employers.employerDetailModel!
                                          .employerDetails!.email,
                                      textAlign: TextAlign.start,
                                      font: 13,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
