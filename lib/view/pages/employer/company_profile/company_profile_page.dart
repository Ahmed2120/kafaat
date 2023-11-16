import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/company_profile_model.dart';
import 'package:kafaat/providers/employer/company_profile_provider.dart';
import 'package:kafaat/view/widgets/active_map_widget.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  File? image, featuredImage, featuredImage2, companyImage;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      CompanyProfileProvider.listenFalse(context).companyProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final companyProfileProvider = CompanyProfileProvider.get(context);
    final companyProfile = companyProfileProvider.companyProfileModel;
    return Scaffold(
      body: companyProfile != null
          ? Builder(builder: (context) {
              String? cont = companyProfile.company?.country;
              CompanyLocation? currLocation =
                  companyProfile.companyLocation?.firstWhere(
                (loc) => loc.id == companyProfile.company?.locationId,
                orElse: () => CompanyLocation(),
              );
              Categories? currCategory = companyProfile.categories?.firstWhere(
                (cat) => cat.id == companyProfile.company?.categoryId,
                orElse: () => Categories(),
              );

              List<Attributes>? attributes = companyProfile.attributes;

              List<Categories>? categories = companyProfile.categories;
              List<String> country = [
                'country 1',
                'country 2',
                'country 3',
              ];

              List<CompanyLocation>? locations = companyProfile.companyLocation;

              if (cont != null) {
                country.add(cont);
              }

              return Column(
                children: [
                  const MainAppBar(title: 'Company Profile'),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Company Info',
                              font: 18,
                              weight: FontWeight.w600,
                              color: AppColors.yTitleColor,
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Company name',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Candidate ',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.name,
                              onChanged: (value) {
                                companyProfile.company?.name = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'E-mail',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Write email',
                              type: TextInputType.emailAddress,
                              initialValue: companyProfile.company?.email,
                              onChanged: (value) {
                                companyProfile.company?.email = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Phone Number',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Write Phone',
                              type: TextInputType.phone,
                              isPhone: true,
                              initialValue: companyProfile.company?.phone,
                              onChanged: (value) {
                                companyProfile.company?.phone = value;
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
                              hint: 'Website',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.website,
                              onChanged: (value) {
                                companyProfile.company?.website = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Est. Since',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Est. science',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.foundedIn,
                              onChanged: (value) {
                                companyProfile.company?.foundedIn = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Address',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Address',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.address,
                              onChanged: (value) {
                                companyProfile.company?.address = value;
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
                              hint: 'City',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.city,
                              onChanged: (value) {
                                companyProfile.company?.city = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'State',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'State',
                              type: TextInputType.text,
                              initialValue: companyProfile.company?.state,
                              onChanged: (value) {
                                companyProfile.company?.state = value;
                              },
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
                              items: country,
                              initialValue: companyProfile.company?.country,
                              onChanged: (value) {
                                companyProfile.company?.country = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Zip Code',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Zip Code',
                              type: TextInputType.number,
                              initialValue:
                                  companyProfile.company?.zipCode ?? '',
                              onChanged: (value) {
                                companyProfile.company?.zipCode = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            MainCheckbox(
                              initialValue:
                                  companyProfile.company?.allowSearch == 1,
                              onChanged: (value) {
                                companyProfile.company?.allowSearch =
                                    value == true ? 1 : 0;
                              },
                              content: 'Allow In Search & Listing',
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'About Company',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Write About Company',
                              minLines: 6,
                              type: TextInputType.text,
                              initialValue: convertHtmlToPlainText(
                                  companyProfile.company?.about ?? ''),
                              onChanged: (value) {
                                companyProfile.company?.about = value;
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
                                      .toList() ??
                                  [])
                                ..remove(''),
                              initialValue: currLocation?.name,
                              onChanged: (value) {
                                companyProfile.company?.locationId = locations
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
                              lat: doubleOf(companyProfile.company?.mapLat),
                              long: doubleOf(companyProfile.company?.mapLng),
                              onCameraMove: (cameraPosition) {
                                setState(() {
                                  companyProfile.companyLocation
                                      ?.firstWhere((loc) =>
                                          loc.id ==
                                          companyProfile.company?.locationId)
                                      .mapZoom = cameraPosition.zoom.toInt();
                                });
                              },
                              onTap: (newPosition) {
                                setState(() {
                                  companyProfile.company?.mapLat =
                                      newPosition.latitude.toString();
                                  companyProfile.company?.mapLng =
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
                              controller: TextEditingController(
                                  text: companyProfile.company?.mapLat ?? ''),
                              hint: '52.85163495168976',
                              type: TextInputType.number,
                              onChanged: (value) {
                                companyProfile.company?.mapLat = value;
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
                              controller: TextEditingController(
                                  text: companyProfile.company?.mapLng ?? ''),
                              hint: '10.667177031027975',
                              type: TextInputType.number,
                              onChanged: (value) {
                                companyProfile.company?.mapLng = value;
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
                              controller: TextEditingController(
                                  text: ((companyProfile.companyLocation
                                              ?.firstWhere(
                                                (loc) =>
                                                    loc.id ==
                                                    companyProfile
                                                        .company?.locationId,
                                                orElse: () => CompanyLocation(),
                                              )
                                              .mapZoom ??
                                          12))
                                      .toString()),
                              hint: '8',
                              type: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  companyProfile.companyLocation
                                      ?.firstWhere((loc) =>
                                          loc.id ==
                                          companyProfile.company?.locationId)
                                      .mapZoom = int.parse(value ?? '12');
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Categories',
                              font: 18,
                              weight: FontWeight.w600,
                              color: AppColors.yTitleColor,
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Category',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            DropMenu(
                              hint: 'Select Category',
                              items: (categories
                                      ?.map((e) => e.name ?? '')
                                      .toList() ??
                                  [])
                                ..remove(''),
                              initialValue: currCategory?.name,
                              onChanged: (value) {
                                companyProfile.company?.categoryId = categories
                                    ?.firstWhere((c) => c.name == value)
                                    .id;
                              },
                            ),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Attribute: Company size',
                              font: 18,
                              weight: FontWeight.w600,
                              color: AppColors.yTitleColor,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                attributes?.length ?? 0,
                                (i) => MainCheckbox(
                                  borderWidth: 1,
                                  textColor: const Color(0xff524B6B),
                                  onChanged: (value) {
                                    setState(() {
                                      companyProfile.company?.teamSize =
                                          attributes?[i].id;
                                    });
                                  },
                                  initialValue: attributes?[i].id ==
                                      companyProfile.company?.teamSize,
                                  content: attributes?[i].name,
                                ),
                              ),
                              //  [
                              //   MainCheckbox(
                              //     borderWidth: 1,
                              //     textColor: const Color(0xff524B6B),
                              //     onChanged: (value) {},
                              //     content: '10-50 Members',
                              //   ),
                              //   const SizedBox(height: 20),
                              //   MainCheckbox(
                              //     borderWidth: 1,
                              //     textColor: const Color(0xff524B6B),
                              //     onChanged: (value) {},
                              //     content: '50-100 Members',
                              //   ),
                              //   const SizedBox(height: 20),
                              //   MainCheckbox(
                              //     borderWidth: 1,
                              //     textColor: const Color(0xff524B6B),
                              //     onChanged: (value) {},
                              //     content: '100-200 Members',
                              //   ),
                              //   const SizedBox(height: 20),
                              //   MainCheckbox(
                              //     borderWidth: 1,
                              //     textColor: const Color(0xff524B6B),
                              //     onChanged: (value) {},
                              //     content: '100-200 Members',
                              //   ),
                              // ],
                            ),
                            const SizedBox(height: 20),
                            // const Divider(),
                            // const SizedBox(height: 20),
                            // const MainText(
                            //   text: 'Upload',
                            //   font: 18,
                            //   weight: FontWeight.w600,
                            //   color: AppColors.yTitleColor,
                            // ),
                            // const SizedBox(height: 20),
                            // const MainText(
                            //   text: 'Company Logo',
                            //   font: 15,
                            //   weight: FontWeight.w500,
                            //   color: AppColors.yMainColor,
                            // ),
                            // const SizedBox(height: 8),
                            // GestureDetector(
                            //   onTap: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (_) => ImagePickerDialog(
                            //         onImageReceived: (XFile? f) async {
                            //           AppRoutes.pop(context);
                            //           if (f != null) {
                            //             companyImage = File(f.path);
                            //             setState(() {});
                            //           }
                            //         },
                            //       ),
                            //     );
                            //   },
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(16),
                            //     child: DottedBorder(
                            //       dashPattern: const [1, 3],
                            //       strokeWidth: 2,
                            //       color: const Color(0xff9D97B5),
                            //       child: Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20),
                            //         height: 80,
                            //         child: Center(
                            //           child: companyImage != null
                            //               ? Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Image.asset(
                            //                       getAsset('upload_icon'),
                            //                       height: 24,
                            //                       width: 24,
                            //                     ),
                            //                     const SizedBox(width: 20),
                            //                     Expanded(
                            //                       child: MainText(
                            //                         text: companyImage!.path,
                            //                         maxLines: 1,
                            //                         overflow: TextOverflow.clip,
                            //                         color:
                            //                             AppColors.yTitleColor,
                            //                         font: 14,
                            //                         weight: FontWeight.w400,
                            //                       ),
                            //                     )
                            //                   ],
                            //                 )
                            //               : Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Image.asset(
                            //                       getAsset('upload_icon'),
                            //                       height: 24,
                            //                       width: 24,
                            //                     ),
                            //                     const SizedBox(width: 20),
                            //                     const MainText(
                            //                       text: 'Upload Logo',
                            //                       color: AppColors.yTitleColor,
                            //                       font: 14,
                            //                       weight: FontWeight.w400,
                            //                     )
                            //                   ],
                            //                 ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 20),
                            // const MainText(
                            //   text: 'Featured Image',
                            //   font: 15,
                            //   weight: FontWeight.w500,
                            //   color: AppColors.yMainColor,
                            // ),
                            // const SizedBox(height: 8),
                            // GestureDetector(
                            //   onTap: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (_) => ImagePickerDialog(
                            //         onImageReceived: (XFile? f) async {
                            //           AppRoutes.pop(context);
                            //           if (f != null) {
                            //             featuredImage = File(f.path);
                            //             setState(() {});
                            //           }
                            //         },
                            //       ),
                            //     );
                            //   },
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(16),
                            //     child: DottedBorder(
                            //       dashPattern: const [1, 3],
                            //       strokeWidth: 2,
                            //       color: const Color(0xff9D97B5),
                            //       child: Container(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20),
                            //         height: 80,
                            //         child: Center(
                            //           child: featuredImage != null
                            //               ? Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Image.asset(
                            //                       getAsset('upload_icon'),
                            //                       height: 24,
                            //                       width: 24,
                            //                     ),
                            //                     const SizedBox(width: 20),
                            //                     Expanded(
                            //                       child: MainText(
                            //                         text: featuredImage!.path,
                            //                         maxLines: 1,
                            //                         overflow: TextOverflow.clip,
                            //                         color:
                            //                             AppColors.yTitleColor,
                            //                         font: 14,
                            //                         weight: FontWeight.w400,
                            //                       ),
                            //                     )
                            //                   ],
                            //                 )
                            //               : Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Image.asset(
                            //                       getAsset('upload_icon'),
                            //                       height: 24,
                            //                       width: 24,
                            //                     ),
                            //                     const SizedBox(width: 20),
                            //                     const MainText(
                            //                       text: 'Upload Logo',
                            //                       color: AppColors.yTitleColor,
                            //                       font: 14,
                            //                       weight: FontWeight.w400,
                            //                     )
                            // ],
                            // ),
                            // ),
                            // ),
                            // ),
                            // ),
                            // ),
                            const SizedBox(height: 40),
                            MainButton(
                              title: 'Save Changes',
                              onPressed: () async {
                                await companyProfileProvider
                                    .updateCompanyProfile(companyProfile);
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
    );
  }
}
