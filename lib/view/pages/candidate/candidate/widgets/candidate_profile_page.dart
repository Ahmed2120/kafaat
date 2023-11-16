import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/helper/functions/string_to_double.dart';
import 'package:kafaat/providers/candidate/candidates_provider.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/map_widget.dart';

class CandidateProfilePage extends StatefulWidget {
  const CandidateProfilePage({
    Key? key,
    required this.slug,
  }) : super(key: key);
  final String slug;

  @override
  State<CandidateProfilePage> createState() => _CandidateProfilePageState();
}

class _CandidateProfilePageState extends State<CandidateProfilePage> {
  bool readMore = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      CandidatesProvider.listenFalse(context).candidateDetails(widget.slug);
    });
  }

  @override
  Widget build(BuildContext context) {
    final candidates = CandidatesProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(),
          candidates.candidateDetailModel != null
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
                                  text: candidates.candidateDetailModel!
                                      .candidateDetails!.title,
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
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MainText(
                                        text: candidates.candidateDetailModel!
                                            .candidateDetails!.country,
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
                                        text: candidates.candidateDetailModel!
                                            .candidateDetails!.educationLevel,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const MainText(
                                          text: 'Expected Salary',
                                          font: 12,
                                          color: AppColors.yDisableTabColor,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 8),
                                        MainText(
                                          text:
                                              '${candidates.candidateDetailModel!.candidateDetails!.expectedSalary}\$ /${candidates.candidateDetailModel!.candidateDetails!.salaryType}',
                                          font: 14,
                                          color: AppColors.yPrimaryColor,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const MainText(
                                          text: 'Education Level',
                                          font: 12,
                                          color: AppColors.yDisableTabColor,
                                          weight: FontWeight.w400,
                                        ),
                                        const SizedBox(height: 8),
                                        MainText(
                                          text:
                                              '${candidates.candidateDetailModel!.candidateDetails!.educationLevel}',
                                          font: 14,
                                          color: AppColors.yMainColor,
                                          weight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                const MainText(
                                  text: 'Bio',
                                  font: 16,
                                  weight: FontWeight.w600,
                                ),
                                const SizedBox(height: 12),
                                MainText(
                                  text: convertHtmlToPlainText(candidates
                                          .candidateDetailModel!
                                          .candidateDetails!
                                          .user
                                          ?.bio ??
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
                                            text: candidates
                                                    .candidateDetailModel!
                                                    .candidateDetails
                                                    ?.city ??
                                                '',
                                            font: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          const SizedBox(height: 12),
                                          MapWidget(
                                            width: context.width,
                                            height: 200,
                                            lat: doubleOf(candidates
                                                .candidateDetailModel!
                                                .candidateDetails
                                                ?.mapLat),
                                            long: doubleOf(candidates
                                                .candidateDetailModel!
                                                .candidateDetails
                                                ?.mapLng),
                                          ),
                                          const SizedBox(height: 20),
                                          const MainText(
                                            text: 'Skills',
                                            font: 16,
                                            weight: FontWeight.w600,
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            children: List.generate(
                                              candidates
                                                  .candidateDetailModel!
                                                  .candidateDetails!
                                                  .skills!
                                                  .length,
                                              (i) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Chip(
                                                  label: MainText(
                                                    text: candidates
                                                        .candidateDetailModel!
                                                        .candidateDetails!
                                                        .skills![i]
                                                        .name,
                                                    font: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const MainText(
                                            text: 'Experiences',
                                            font: 16,
                                            weight: FontWeight.w600,
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            children: List.generate(
                                              candidates
                                                  .candidateDetailModel!
                                                  .candidateDetails!
                                                  .experience!
                                                  .length,
                                              (i) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Chip(
                                                  label: MainText(
                                                    text: candidates
                                                        .candidateDetailModel!
                                                        .candidateDetails!
                                                        .experience![i]
                                                        .position,
                                                    font: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const MainText(
                                            text: 'Educations',
                                            font: 16,
                                            weight: FontWeight.w600,
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            children: List.generate(
                                              candidates
                                                  .candidateDetailModel!
                                                  .candidateDetails!
                                                  .education!
                                                  .length,
                                              (i) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Chip(
                                                  label: MainText(
                                                    text: candidates
                                                        .candidateDetailModel!
                                                        .candidateDetails!
                                                        .education![i]
                                                        .reward,
                                                    font: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const MainText(
                                            text: 'Awards',
                                            font: 16,
                                            weight: FontWeight.w600,
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            children: List.generate(
                                              candidates
                                                  .candidateDetailModel!
                                                  .candidateDetails!
                                                  .award!
                                                  .length,
                                              (i) => Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Chip(
                                                  label: MainText(
                                                    text: candidates
                                                        .candidateDetailModel!
                                                        .candidateDetails!
                                                        .award![i]
                                                        .reward,
                                                    font: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(height: 20),
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
                                      text: candidates.candidateDetailModel!
                                          .candidateDetails?.user?.email,
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
