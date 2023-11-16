import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/helper/functions/string_to_double.dart';
import 'package:kafaat/models/create_jobs_model.dart';
import 'package:kafaat/providers/employer/add_new_job_provider.dart';
import 'package:kafaat/view/widgets/active_map_widget.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/image_picker_dialog.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/main_checkbox.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key});

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  List<String> gender = [
    'Male',
    'Female',
    'Both',
  ];

  List<String> radioGroup = [
    'Publish',
    'Draft',
  ];

  List<String> hoursTypes = [
    'day',
    'week',
    'month',
    'year',
  ];
  List<String> salaryTypes = [
    'hourly',
    'daily',
    'weekly',
    'monthly',
    'yearly',
  ];

  int groupValue = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      AddNewJobProvider.listenFalse(context).getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final addNewJob = AddNewJobProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Add New Job'),
          Expanded(
            child: addNewJob.createJobDataStatus == DataStatus.successed
                ? Builder(builder: (context) {
                    List<Categories> categories =
                        addNewJob.createJobModel!.categories!;
                    List<JobLocation> locactions =
                        addNewJob.createJobModel!.jobLocation!;
                    List<JobSkills> jobSkills =
                        addNewJob.createJobModel!.jobSkills!;
                    List<JobTypes> jobTypes =
                        addNewJob.createJobModel!.jobTypes!;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: addNewJob.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const MainText(
                              text: 'Title',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Title',
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.title = value;
                              },
                              valid: (value) {
                                return value!.isEmpty
                                    ? 'Please Enter Job Title'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Content',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Write Content',
                              minLines: 6,
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.content = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Expiration Date',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              controller: addNewJob.expDateController,
                              hint: 'YYYY/MM/DD',
                              read: true,
                              valid: (value) {
                                return value!.isEmpty
                                    ? 'Please Enter Job Expiration Date'
                                    : null;
                              },
                              onTap: () async {
                                DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)),
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  builder: (BuildContext ctx, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        dialogTheme: DialogTheme(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              25.0,
                                            ),
                                          ),
                                        ),
                                        colorScheme: const ColorScheme.light(
                                          primary: AppColors.yPrimaryColor,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: AppColors.yMainColor,
                                        ),
                                        dialogBackgroundColor: Colors.white,
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (dt != null) {
                                  setState(() {
                                    addNewJob.expDateController.text = dt
                                        .toString()
                                        .substring(0, 10)
                                        .replaceAll(RegExp(r'-'), '/');
                                  });
                                }
                              },
                              type: TextInputType.text,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Image.asset(
                                  getAsset('calendar_icon'),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Hours',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: MainTextField(
                                    hint: 'hours',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      addNewJob.hours = value;
                                    },
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      child: Image.asset(
                                        getAsset('time_icon'),
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: DropMenu(
                                    hint: '-',
                                    items: hoursTypes,
                                    onChanged: (value) {
                                      addNewJob.hoursType = value;
                                    },
                                  ),
                                ),
                              ],
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
                              initialValue: gender[2],
                              items: gender,
                              onChanged: (value) {
                                addNewJob.gender = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Salary',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: MainTextField(
                                    hint: 'Min',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      addNewJob.salaryMin = value;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  flex: 2,
                                  child: MainTextField(
                                    hint: 'Max',
                                    type: TextInputType.number,
                                    onChanged: (value) {
                                      addNewJob.salaryMax = value;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  flex: 3,
                                  child: DropMenu(
                                    hint: '/hourly',
                                    initialValue: salaryTypes[0],
                                    items: salaryTypes,
                                    onChanged: (value) {
                                      addNewJob.salaryType = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            MainCheckbox(
                              onChanged: (value) {
                                addNewJob.isWageAgree = value;
                              },
                              content: 'Wage Agreement',
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Experience',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Experience(years)',
                              type: TextInputType.number,
                              onChanged: (value) {
                                addNewJob.experience = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Number of Recruitments',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: '0',
                              type: TextInputType.number,
                              onChanged: (value) {
                                addNewJob.numberRecruitments = value;
                              },
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
                              hint: 'Youtube link video',
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.vedioUrl = value;
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
                                            onImageReceived: (XFile? f) async {
                                          AppRoutes.pop(context);
                                          if (f != null) {
                                            addNewJob.imageFile = File(f.path);
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
                                      child: addNewJob.imageFile != null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  getAsset('upload_icon'),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: MainText(
                                                    text: addNewJob
                                                        .imageFile!.path,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    color:
                                                        AppColors.yTitleColor,
                                                    font: 14,
                                                    weight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
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
                                                  text: 'Upload Logo',
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
                              items: locactions
                                  .map((e) => e.name!)
                                  .toSet()
                                  .toList(),
                              onChanged: (value) {
                                addNewJob.locationId = locactions
                                    .firstWhere((e) => e.name == value)
                                    .id!;
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
                            GestureDetector(
                              onVerticalDragStart: (details) {},
                              child: ActiveMapWidget(
                                width: context.width,
                                height: 300,
                                lat: doubleOf(addNewJob.latController.text),
                                long: doubleOf(addNewJob.longController.text),
                                zoom: doubleOf(addNewJob.zoomController.text),
                                onCameraMove: (cameraPosition) {
                                  setState(() {
                                    addNewJob.zoomController.text =
                                        cameraPosition.zoom.toString();
                                  });
                                },
                                onTap: (newPosition) {
                                  setState(() {
                                    addNewJob.latController.text =
                                        newPosition.latitude.toString();
                                    addNewJob.longController.text =
                                        newPosition.longitude.toString();
                                  });
                                },
                              ),
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
                              controller: addNewJob.latController,
                              type: TextInputType.number,
                              onChanged: (value) {
                                setState(() {});
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
                              controller: addNewJob.longController,
                              type: TextInputType.number,
                              onChanged: (value) {
                                setState(() {});
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
                              controller: addNewJob.zoomController,
                              type: TextInputType.number,
                              onChanged: (value) {
                                setState(() {});
                              },
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
                                  radioGroup.length,
                                  (i) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MainText(
                                            text: radioGroup[i],
                                            font: 16,
                                            weight: FontWeight.w400,
                                            color: AppColors.yDisableTabColor,
                                          ),
                                          Radio(
                                            value: i,
                                            groupValue: groupValue,
                                            activeColor:
                                                AppColors.yPrimaryColor,
                                            onChanged: (int? i) {
                                              setState(() {
                                                groupValue = i!;
                                                addNewJob.status =
                                                    radioGroup[i];
                                              });
                                            },
                                          ),
                                        ],
                                      )),
                            ),
                            const SizedBox(height: 40),
                            const MainText(
                              text: 'Availability',
                              font: 18,
                              weight: FontWeight.w600,
                              color: AppColors.yTitleColor,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainCheckbox(
                                  borderWidth: 1,
                                  textColor: const Color(0xff524B6B),
                                  onChanged: (value) {
                                    addNewJob.isFeatured = value;
                                  },
                                  content: 'Enable Featured',
                                ),
                                const SizedBox(height: 20),
                                MainCheckbox(
                                  borderWidth: 1,
                                  textColor: const Color(0xff524B6B),
                                  onChanged: (value) {
                                    addNewJob.isUrgent = value;
                                  },
                                  content: 'Enable Urgent',
                                ),
                              ],
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
                              hint: '- Please Select -',
                              items: categories
                                  .map((e) => e.name!)
                                  .toSet()
                                  .toList(),
                              onChanged: (value) {
                                addNewJob.categoryId = categories
                                    .firstWhere((e) => e.name == value)
                                    .id!;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Job Type',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            DropMenu(
                              hint: '- Please Select -',
                              items:
                                  jobTypes.map((e) => e.name!).toSet().toList(),
                              onChanged: (value) {
                                addNewJob.jobTypeId = jobTypes
                                    .firstWhere((e) => e.name == value)
                                    .id!;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Job Skills',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            DropMenu(
                              hint: 'Skills',
                              items: jobSkills
                                  .map((e) => e.name!)
                                  .toSet()
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  addNewJob.jobSkills.add(jobSkills
                                      .firstWhere((e) => e.name == value)
                                      .id!);
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              children: List.generate(
                                addNewJob.jobSkills.length,
                                (i) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Chip(
                                    label: MainText(
                                      text: jobSkills
                                          .firstWhere((e) =>
                                              e.id ==
                                              addNewJob.jobSkills.toList()[i])
                                          .name,
                                      font: 14,
                                    ),
                                    deleteIcon: const Icon(Icons.close_rounded),
                                    onDeleted: () {
                                      setState(() {
                                        addNewJob.jobSkills.remove(
                                            addNewJob.jobSkills.toList()[i]);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),

                            // const SizedBox(height: 20),
                            // const MainText(
                            //   text: 'Company',
                            //   font: 15,
                            //   weight: FontWeight.w500,
                            //   color: AppColors.yMainColor,
                            // ),
                            // const SizedBox(height: 8),
                            // DropMenu(
                            //   hint: '- Please Select -',
                            //   items: categories,
                            //   onChanged: (value) {
                            //     addNewJob.company = value;
                            //   },
                            // ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Upload',
                              font: 18,
                              weight: FontWeight.w600,
                              color: AppColors.yTitleColor,
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
                                        addNewJob.featuredImageFile =
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
                                      child: addNewJob.featuredImageFile != null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  getAsset('upload_icon'),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: MainText(
                                                    text: addNewJob
                                                        .featuredImageFile!
                                                        .path,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    color:
                                                        AppColors.yTitleColor,
                                                    font: 14,
                                                    weight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
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
                                                  text: 'Upload Logo',
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
                              hint: 'Seo Title',
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.seoTitle = value;
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
                              hint: 'Seo Description',
                              minLines: 6,
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.seoDes = value;
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
                                        addNewJob.seoImageFile = File(f.path);
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
                                      child: addNewJob.seoImageFile != null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  getAsset('upload_icon'),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: MainText(
                                                    text: addNewJob
                                                        .seoImageFile!.path,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                    color:
                                                        AppColors.yTitleColor,
                                                    font: 14,
                                                    weight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
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
                                                  text: 'Upload Logo',
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
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Share Facebook',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Enter link',
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.facebook = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            const MainText(
                              text: 'Share Twitter',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            const SizedBox(height: 8),
                            MainTextField(
                              hint: 'Enter link',
                              type: TextInputType.text,
                              onChanged: (value) {
                                addNewJob.twitter = value;
                              },
                            ),
                            const SizedBox(height: 40),
                            MainButton(
                              title: 'Save Changes',
                              onPressed: () async {
                                if (addNewJob.formKey.currentState!
                                        .validate() &&
                                    addNewJob.title != null &&
                                    addNewJob.title!.isNotEmpty &&
                                    addNewJob.locationId != null &&
                                    addNewJob.jobTypeId != null &&
                                    addNewJob.categoryId != null &&
                                    addNewJob
                                        .expDateController.text.isNotEmpty) {
                                  await addNewJob.addNewJob();
                                } else {
                                  showSnackbar('Enter validation values',
                                      error: true);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
