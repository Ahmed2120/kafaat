import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/helper/functions/pick_multi_images.dart';
import 'package:kafaat/models/candidate_profile_model.dart';
import 'package:kafaat/providers/candidate/candidate_profile_provider.dart';
import 'package:kafaat/view/pages/candidate/my_profile/widgets/profile_data_row.dart';
import 'package:kafaat/view/pages/candidate/my_profile/widgets/profile_data_table.dart';
import 'package:kafaat/view/widgets/active_map_widget.dart';
import 'package:kafaat/view/widgets/custom_data_column.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/image_picker_dialog.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      CandidateProfileProvider.listenFalse(context).candidateProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final candidateProfile = CandidateProfileProvider.get(context);
    final profile = candidateProfile.candidateProfileModel;
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'My Profile'),
          Expanded(
            child: profile != null
                ? Builder(builder: (context) {
                    List<Locations>? locations = profile.locations;
                    Locations? currLocation = profile.locations?.firstWhere(
                      (loc) => loc.id == profile.profile?.locationId,
                      orElse: () => Locations(),
                    );
                    Map<String, String> educationLevels = {
                      'certificate': 'Certificate',
                      'diploma': 'Diploma',
                      'associate': 'Associate Degree',
                      'bachelor': 'Bachelor Degree',
                      'master': 'Master’s Degree',
                      'professional': 'Professional’s Degree',
                    };
                    String? educationLevel = educationLevels.keys
                        .toList()
                        .firstWhere(
                          (g) =>
                              g.toLowerCase() ==
                              profile.profile?.educationLevel?.toLowerCase(),
                          orElse: () => '',
                        );

                    List<String>? languages =
                        profile.languages?.values.toList() ?? [];
                    List<String>? selectedLanguages =
                        (profile.profile?.languages?.split(',') ?? [])
                          ..remove('');

                    List<String> salaryTypes = [
                      'hourly',
                      'daily',
                      'weekly',
                      'monthly',
                      'yearly',
                    ];
                    String? salaryType = salaryTypes.firstWhere(
                      (g) =>
                          g.toLowerCase() ==
                          profile.profile?.salaryType?.toLowerCase(),
                      orElse: () => '',
                    );
                    List<String> genders = [
                      'Male',
                      'Female',
                      'Both',
                    ];
                    String? gender = genders.firstWhere(
                      (g) =>
                          g.toLowerCase() ==
                          profile.profile?.gender?.toLowerCase(),
                      orElse: () => '',
                    );
                    List<String> country = [];
                    if (!countries.contains(profile.profile?.country) &&
                        profile.profile?.country != null &&
                        profile.profile!.country!.isNotEmpty) {
                      countries.insertAll(0, [profile.profile?.country ?? '']);
                    }
                    country = countries;

                    List<Education> educations =
                        profile.profile?.education ?? [];
                    List<Experience> experiences =
                        profile.profile?.experience ?? [];
                    List<Award> awards = profile.profile?.award ?? [];
                    List<Categories> categories = profile.categories ?? [];
                    List<Skills> skills = profile.skills ?? [];

                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Candidate info',
                                    font: 18,
                                    weight: FontWeight.w600,
                                    color: AppColors.yTitleColor,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const MainText(
                                              text: 'First name',
                                              font: 15,
                                              weight: FontWeight.w500,
                                              color: AppColors.yMainColor,
                                            ),
                                            const SizedBox(height: 8),
                                            MainTextField(
                                              isUnfocused: true,
                                              hint: 'First name',
                                              type: TextInputType.text,
                                              initialValue:
                                                  profile.user?.firstName ?? '',
                                              onChanged: (value) {
                                                profile.user?.firstName = value;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const MainText(
                                              text: 'Last name',
                                              font: 15,
                                              weight: FontWeight.w500,
                                              color: AppColors.yMainColor,
                                            ),
                                            const SizedBox(height: 8),
                                            MainTextField(
                                              isUnfocused: true,
                                              hint: 'Last name',
                                              type: TextInputType.text,
                                              initialValue:
                                                  profile.user?.lastName ?? '',
                                              onChanged: (value) {
                                                profile.user?.lastName = value;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Current Position',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Write Current Position',
                                    initialValue: profile.profile?.title ?? '',
                                    onChanged: (value) {
                                      profile.profile?.title = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Website',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Website',
                                    initialValue:
                                        profile.profile?.website ?? '',
                                    onChanged: (value) {
                                      profile.profile?.website = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Gender',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Both',
                                    initialValue:
                                        gender.isNotEmpty ? gender : null,
                                    items: genders,
                                    onChanged: (value) {
                                      profile.profile?.gender =
                                          value!.toLowerCase();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Expected Salary',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MainTextField(
                                          isUnfocused: true,
                                          hint: 'Expected Salary',
                                          type: TextInputType.number,
                                          initialValue: profile.profile
                                                      ?.expectedSalary !=
                                                  null
                                              ? (profile.profile?.expectedSalary
                                                      .toString() ??
                                                  '')
                                              : '',
                                          onChanged: (value) {
                                            profile.profile?.expectedSalary =
                                                value.toIntNum;
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: DropMenu(
                                          hint: '/hourly',
                                          initialValue: salaryType.isNotEmpty
                                              ? salaryType
                                              : null,
                                          items: salaryTypes,
                                          onChanged: (value) {
                                            profile.profile?.salaryType = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Experience(years)',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Experience(years)',
                                    initialValue:
                                        profile.profile?.experienceYear != null
                                            ? (profile.profile?.experienceYear
                                                    .toString() ??
                                                '')
                                            : '',
                                    onChanged: (value) {
                                      profile.profile?.experienceYear =
                                          value.toIntNum;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Education level',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Professional',
                                    items: educationLevels.values.toList(),
                                    initialValue: educationLevel.isNotEmpty
                                        ? educationLevels.keys
                                                .firstWhere(
                                                  (e) => e == educationLevel,
                                                  orElse: () => '',
                                                )
                                                .isNotEmpty
                                            ? educationLevels[
                                                educationLevels.keys.firstWhere(
                                                (e) => e == educationLevel,
                                                orElse: () => '',
                                              )]
                                            : null
                                        : null,
                                    onChanged: (value) {
                                      profile.profile?.educationLevel =
                                          educationLevels.getKeyOfValue(value!);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Language',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Language',
                                    items: languages,
                                    initialValue: null,
                                    onChanged: (value) {
                                      setState(() {
                                        profile.profile?.languages = (profile
                                                        .profile?.languages !=
                                                    null &&
                                                profile.profile!.languages!
                                                    .isNotEmpty)
                                            ? '${profile.profile?.languages},${value!}'
                                            : value;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    children: List.generate(
                                      selectedLanguages.length,
                                      (i) => Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Chip(
                                          label: MainText(
                                            text: selectedLanguages[i],
                                            font: 12,
                                          ),
                                          onDeleted: () {
                                            setState(() {
                                              selectedLanguages
                                                  .remove(selectedLanguages[i]);
                                              profile.profile?.languages =
                                                  selectedLanguages.join(',');
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Video Url',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Youtube link video',
                                    type: TextInputType.text,
                                    onChanged: (value) {
                                      profile.profile?.video = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Video Cover Image',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => ImagePickerDialog(
                                                  onImageReceived:
                                                      (XFile? f) async {
                                                AppRoutes.pop(context);
                                                if (f != null) {
                                                  candidateProfile
                                                          .videoImageFile =
                                                      File(f.path);
                                                  setState(() {});
                                                }
                                              }));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: DottedBorder(
                                        dashPattern: const [1, 3],
                                        strokeWidth: 2,
                                        color: const Color(0xff9D97B5),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 80,
                                          child: Center(
                                            child: candidateProfile
                                                        .videoImageFile !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: MainText(
                                                          text: candidateProfile
                                                              .videoImageFile!
                                                              .path,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          color: AppColors
                                                              .yTitleColor,
                                                          font: 14,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      const MainText(
                                                        text: 'Upload Logo',
                                                        color: AppColors
                                                            .yTitleColor,
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
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Gallery',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () async {
                                      await showImagePickerDialog(context);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: DottedBorder(
                                        dashPattern: const [1, 3],
                                        strokeWidth: 2,
                                        color: const Color(0xff9D97B5),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 80,
                                          child: Center(
                                            child: candidateProfile
                                                        .galleryFiles !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: MainText(
                                                          text:
                                                              '${candidateProfile.galleryFiles?.length ?? 0} Images',
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          color: AppColors
                                                              .yTitleColor,
                                                          font: 14,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      const MainText(
                                                        text: 'Upload Gallery',
                                                        color: AppColors
                                                            .yTitleColor,
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
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'About',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'About ',
                                    type: TextInputType.text,
                                    initialValue: profile.user?.bio ?? '',
                                    maxLines: 4,
                                    verticalPadding: 8,
                                    onChanged: (value) {
                                      profile.user?.bio = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Job Location',
                                    font: 18,
                                    weight: FontWeight.w600,
                                    color: AppColors.yTitleColor,
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Country',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Select Country',
                                    items: country.toSet().toList(),
                                    initialValue: profile.profile?.country,
                                    onChanged: (value) {
                                      profile.profile?.country = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'City',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'City',
                                    type: TextInputType.text,
                                    initialValue: profile.profile?.city ?? '',
                                    onChanged: (value) {
                                      profile.profile?.city = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Address Line',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Address Line',
                                    type: TextInputType.text,
                                    initialValue:
                                        profile.profile?.address ?? '',
                                    onChanged: (value) {
                                      profile.profile?.address = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  // const SizedBox(height: 20),
                                  // MainCheckbox(
                                  //   initialValue:
                                  //       candidateProfile.candidate!.allowSearch == 1,
                                  //   onChanged: (value) {
                                  //     candidateProfile.candidate!.allowSearch =
                                  //         value == true ? 1 : 0;
                                  //   },
                                  //   content: 'Allow In Search & Listing',
                                  // ),
                                  // const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Location',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Select Location',
                                    items: (locations
                                            ?.map((e) => e.name ?? '')
                                            .toSet()
                                            .toList() ??
                                        []),
                                    initialValue: currLocation?.name,
                                    onChanged: (value) {
                                      profile.profile!.locationId = locations
                                          ?.firstWhere((l) => l.name == value)
                                          .id;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'The geographic coordinate',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  ActiveMapWidget(
                                    width: context.width,
                                    height: 250,
                                    lat: doubleOf(profile.profile?.mapLat),
                                    long: doubleOf(profile.profile?.mapLng),
                                    onCameraMove: (cameraPosition) {
                                      setState(() {
                                        profile.locations!
                                                .firstWhere((loc) =>
                                                    loc.id ==
                                                    profile.profile!.locationId)
                                                .mapZoom =
                                            cameraPosition.zoom.toInt();
                                      });
                                    },
                                    onTap: (newPosition) {
                                      setState(() {
                                        profile.profile?.mapLat =
                                            newPosition.latitude.toString();
                                        profile.profile?.mapLng =
                                            newPosition.longitude.toString();
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Map Latitude',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    controller: TextEditingController(
                                        text: profile.profile?.mapLat ?? ''),
                                    hint: '52.8516349516',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      profile.profile?.mapLat = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Map Longitude:',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    controller: TextEditingController(
                                        text: profile.profile?.mapLng ?? ''),
                                    hint: '10.66717703102',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      profile.profile?.mapLng = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Map Zoom:',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    controller: TextEditingController(
                                        text: (profile.locations
                                                    ?.firstWhere(
                                                      (loc) =>
                                                          loc.id ==
                                                          profile.profile
                                                              ?.locationId,
                                                      orElse: () => Locations(),
                                                    )
                                                    .mapZoom ??
                                                12)
                                            .toString()),
                                    hint: '8',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        profile.locations
                                            ?.firstWhere((loc) =>
                                                loc.id ==
                                                profile.profile?.locationId)
                                            .mapZoom = int.parse(value ?? '12');
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Education - Experience - Award',
                                    font: 18,
                                    weight: FontWeight.w600,
                                    color: AppColors.yTitleColor,
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Education',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  List.generate(
                                    educations.length,
                                    (i) => DataRow(
                                      cells: educationDataRow(educations[i]),
                                    ),
                                  ).isNotEmpty
                                      ? ProfileDataTable(
                                          columns: [
                                            customDataColumn('Reward'),
                                            customDataColumn('Location'),
                                            customDataColumn('From'),
                                            customDataColumn('To'),
                                          ],
                                          rows: List.generate(
                                            educations.length,
                                            (i) => DataRow(
                                              cells: educationDataRow(
                                                  educations[i]),
                                            ),
                                          ),
                                        )
                                      : MainText(
                                          text: 'No Education',
                                          font: 13,
                                          weight: FontWeight.w400,
                                          color: AppColors.yMainColor
                                              .withOpacity(0.7),
                                        ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Experience',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  List.generate(
                                    experiences.length,
                                    (i) => DataRow(
                                      cells: experienceDataRow(experiences[i]),
                                    ),
                                  ).isNotEmpty
                                      ? ProfileDataTable(
                                          columns: [
                                            customDataColumn('Position'),
                                            customDataColumn('Location'),
                                            customDataColumn('From'),
                                            customDataColumn('To'),
                                          ],
                                          rows: List.generate(
                                            experiences.length,
                                            (i) => DataRow(
                                              cells: experienceDataRow(
                                                  experiences[i]),
                                            ),
                                          ),
                                        )
                                      : MainText(
                                          text: 'No Experience',
                                          font: 13,
                                          weight: FontWeight.w400,
                                          color: AppColors.yMainColor
                                              .withOpacity(0.7),
                                        ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Awards',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  List.generate(
                                    awards.length,
                                    (i) => DataRow(
                                      cells: awardDataRow(awards[i]),
                                    ),
                                  ).isNotEmpty
                                      ? ProfileDataTable(
                                          columns: [
                                            customDataColumn('Reward'),
                                            customDataColumn('Location'),
                                            customDataColumn('From'),
                                            customDataColumn('To'),
                                          ],
                                          rows: List.generate(
                                            awards.length,
                                            (i) => DataRow(
                                              cells: awardDataRow(awards[i]),
                                            ),
                                          ),
                                        )
                                      : MainText(
                                          text: 'No Awards',
                                          font: 13,
                                          weight: FontWeight.w400,
                                          color: AppColors.yMainColor
                                              .withOpacity(0.7),
                                        ),
                                  const SizedBox(height: 20),
                                  const Divider(),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Seo Manager',
                                    font: 18,
                                    weight: FontWeight.w600,
                                    color: AppColors.yTitleColor,
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Seo Title',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Seo Title ',
                                    type: TextInputType.text,
                                    initialValue: profile.seo?.seoTitle ?? '',
                                    onChanged: (value) {
                                      profile.user?.bio = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Seo Description',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  MainTextField(
                                    isUnfocused: true,
                                    hint: 'Seo Description ',
                                    type: TextInputType.text,
                                    initialValue: profile.seo?.seoDesc ?? '',
                                    maxLines: 4,
                                    verticalPadding: 8,
                                    onChanged: (value) {
                                      profile.user?.bio = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Featured Image',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => ImagePickerDialog(
                                          onImageReceived: (XFile? f) async {
                                            AppRoutes.pop(context);
                                            if (f != null) {
                                              candidateProfile.seoImageFile =
                                                  File(f.path);
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: DottedBorder(
                                        dashPattern: const [1, 3],
                                        strokeWidth: 2,
                                        color: const Color(0xff9D97B5),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 80,
                                          child: Center(
                                            child: candidateProfile
                                                        .seoImageFile !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: MainText(
                                                          text: candidateProfile
                                                              .seoImageFile!
                                                              .path,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          color: AppColors
                                                              .yTitleColor,
                                                          font: 14,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      const MainText(
                                                        text: 'Upload',
                                                        color: AppColors
                                                            .yTitleColor,
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
                                  // const SizedBox(height: 20),
                                  // const MainText(
                                  //   text: 'Share Facebook',
                                  //   font: 15,
                                  //   weight: FontWeight.w500,
                                  //   color: AppColors.yMainColor,
                                  // ),
                                  // const SizedBox(height: 8),
                                  // MainTextField(
                                  // isUnfocused: true,
                                  //   hint: 'Enter link',
                                  //   type: TextInputType.text,
                                  //   initialValue:
                                  //       profile.profile?.socialMedia?.facebook ?? '',
                                  //   onChanged: (value) {
                                  //     profile.profile?.socialMedia?.facebook = value;
                                  //   },
                                  // ),
                                  // const SizedBox(height: 20),
                                  // const MainText(
                                  //   text: 'Share Twitter',
                                  //   font: 15,
                                  //   weight: FontWeight.w500,
                                  //   color: AppColors.yMainColor,
                                  // ),
                                  // const SizedBox(height: 8),
                                  // MainTextField(
                                  //  isUnfocused: true,
                                  //   hint: 'Enter link',
                                  //   type: TextInputType.text,
                                  //   initialValue:
                                  //       profile.profile?.socialMedia?.twitter ?? '',
                                  //   onChanged: (value) {
                                  //     profile.profile?.socialMedia?.twitter = value;
                                  //   },
                                  // ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Categories',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Categories',
                                    items:
                                        categories.map((e) => e.name!).toList(),
                                    initialValue: null,
                                    onChanged: (value) {
                                      setState(() {
                                        if ((profile.usercategories != null &&
                                            profile
                                                .usercategories!.isNotEmpty)) {
                                          profile.usercategories!.add(
                                              categories.firstWhere(
                                                  (e) => e.name == value));
                                        } else {
                                          profile.usercategories = [
                                            categories.firstWhere(
                                                (e) => e.name == value)
                                          ];
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    children: List.generate(
                                      profile.usercategories?.length ?? 0,
                                      (i) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Chip(
                                            label: MainText(
                                              text: profile.usercategories
                                                  ?.map((e) => e.name!)
                                                  .toList()[i],
                                              font: 12,
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                profile.usercategories!.remove(
                                                    profile.usercategories![i]);
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Skills',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  DropMenu(
                                    hint: 'Skills',
                                    items: skills.map((e) => e.name!).toList(),
                                    initialValue: null,
                                    onChanged: (value) {
                                      setState(() {
                                        if ((profile.userskills != null &&
                                            profile.userskills!.isNotEmpty)) {
                                          profile.userskills!.add(
                                              skills.firstWhere(
                                                  (e) => e.name == value));
                                        } else {
                                          profile.userskills = [
                                            skills.firstWhere(
                                                (e) => e.name == value)
                                          ];
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Wrap(
                                    children: List.generate(
                                      profile.userskills?.length ?? 0,
                                      (i) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Chip(
                                            label: MainText(
                                              text: profile.userskills
                                                  ?.map((e) => e.name!)
                                                  .toList()[i],
                                              font: 12,
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                profile.userskills!.remove(
                                                    profile.userskills![i]);
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const MainText(
                                    text: 'Avatar Image',
                                    font: 15,
                                    weight: FontWeight.w500,
                                    color: AppColors.yMainColor,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => ImagePickerDialog(
                                          onImageReceived: (XFile? f) async {
                                            AppRoutes.pop(context);
                                            if (f != null) {
                                              candidateProfile.avatarImageFile =
                                                  File(f.path);
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: DottedBorder(
                                        dashPattern: const [1, 3],
                                        strokeWidth: 2,
                                        color: const Color(0xff9D97B5),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 80,
                                          child: Center(
                                            child: candidateProfile
                                                        .avatarImageFile !=
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: MainText(
                                                          text: candidateProfile
                                                              .avatarImageFile!
                                                              .path,
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          color: AppColors
                                                              .yTitleColor,
                                                          font: 14,
                                                          weight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        getAsset('upload_icon'),
                                                        height: 24,
                                                        width: 24,
                                                      ),
                                                      const SizedBox(width: 20),
                                                      const MainText(
                                                        text: 'Upload',
                                                        color: AppColors
                                                            .yTitleColor,
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
                                  const SizedBox(height: 40),
                                  MainButton(
                                    title: 'Save Changes',
                                    onPressed: () async {
                                      await candidateProfile
                                          .updateCandidateProfile(profile);
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  MainButton(
                                    title: 'Become a Company',
                                    onPressed: () async {
                                      await candidateProfile.becomeCompany();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  })
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
