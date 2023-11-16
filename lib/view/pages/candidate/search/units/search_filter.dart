// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';

// import '../../../../../../../constants.dart';
// import '../../../../../../../core/router/router.dart';
// import '../../../../../../../widgets/candidateCustomScaffold.dart';
// import '../../../../../../../widgets/customButton.dart';
// import '../../../../../../../widgets/main_text.dart';
// import '../../../../../../../widgets/remember_me.dart';

// class SearchFilter extends StatefulWidget {
//   const SearchFilter({Key? key}) : super(key: key);

//   @override
//   State<SearchFilter> createState() => _SearchFilterState();
// }

// class _SearchFilterState extends State<SearchFilter> {
//   int lastUpdateGroup = 0;
//   int experienceIndex = 0;
//   int workTypeGroup = 0;
//   int jobTypeIndex = 0;
//   int positionLevelIndex = 0;
//   SfRangeValues _values = SfRangeValues(5000, 50000);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         title: 'Filter',
//         body: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           child: Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Last Update',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                         lastUpdate.length,
//                         (i) => Row(
//                               children: [
//                                 Radio(
//                                     value: i,
//                                     groupValue: lastUpdateGroup,
//                                     activeColor: kPrimaryColor,
//                                     onChanged: (int? i) {
//                                       setState(() {
//                                         lastUpdateGroup = i!;
//                                       });
//                                     }),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 MainText(
//                                   text: lastUpdate[i],
//                                   font: 16,
//                                   weight: FontWeight.w400,
//                                   color: AppColors.yMainColor,
//                                 ),
//                               ],
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Type of workplace',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                         typeOfWorkplace.length,
//                         (i) => Row(
//                               children: [
//                                 Radio(
//                                     value: i,
//                                     groupValue: workTypeGroup,
//                                     activeColor: kPrimaryColor,
//                                     onChanged: (int? i) {
//                                       setState(() {
//                                         workTypeGroup = i!;
//                                       });
//                                     }),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 MainText(
//                                   text: typeOfWorkplace[i],
//                                   font: 16,
//                                   weight: FontWeight.w400,
//                                   color: AppColors.yMainColor,
//                                 ),
//                               ],
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Job Type',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Wrap(
//                     children: List.generate(
//                         jobType.length,
//                         (i) => GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   jobTypeIndex = i;
//                                 });
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 8),
//                                 margin:
//                                     EdgeInsets.only(right: 20, bottom: 10),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: i == jobTypeIndex
//                                         ? kPrimaryColor
//                                         : Color(0xffCBC9D4).withOpacity(0.2)),
//                                 child: MainText(
//                                   text: jobType[i],
//                                   font: 16,
//                                   weight: FontWeight.w400,
//                                   color: i == jobTypeIndex
//                                       ? kWhiteColor
//                                       : Color(0xff524B6B),
//                                 ),
//                               ),
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Position level',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Wrap(
//                     children: List.generate(
//                         positionLevel.length,
//                         (i) => GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   positionLevelIndex = i;
//                                 });
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 8),
//                                 margin:
//                                     EdgeInsets.only(right: 20, bottom: 10),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: i == positionLevelIndex
//                                         ? kPrimaryColor
//                                         : Color(0xffCBC9D4).withOpacity(0.2)),
//                                 child: MainText(
//                                   text: jobType[i],
//                                   font: 16,
//                                   weight: FontWeight.w400,
//                                   color: i == positionLevelIndex
//                                       ? kWhiteColor
//                                       : Color(0xff524B6B),
//                                 ),
//                               ),
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'City',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                         city.length,
//                         (i) => Padding(
//                               padding: EdgeInsets.only(bottom: 20),
//                               child: RememberMe(
//                                 onCheck: (bool b) {},
//                                 content: city[i],
//                               ),
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Salary',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   SfRangeSlider(
//                     inactiveColor: kGreyColor,
//                     activeColor: kPrimaryColor,
//                     min: 0,
//                     max: 100000,
//                     values: _values,
//                     interval: 20,
//                     enableTooltip: true,
//                     showLabels: false,
//                     labelPlacement: LabelPlacement.betweenTicks,
//                     minorTicksPerInterval: 1,
//                     enableIntervalSelection: false,
//                     onChanged: (SfRangeValues values) {
//                       setState(() {
//                         _values = values;
//                       });
//                     },
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Experience',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                         experience.length,
//                         (i) => Row(
//                               children: [
//                                 Radio(
//                                     value: i,
//                                     groupValue: experienceIndex,
//                                     activeColor: kPrimaryColor,
//                                     onChanged: (int? i) {
//                                       setState(() {
//                                         experienceIndex = i!;
//                                       });
//                                     }),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 MainText(
//                                   text: experience[i],
//                                   font: 16,
//                                   weight: FontWeight.w400,
//                                   color: AppColors.yMainColor,
//                                 ),
//                               ],
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MainText(
//                         text: 'Specialization',
//                         font: 15,
//                         weight: FontWeight.w600,
//                       ),
//                       Image.asset(
//                         getAsset('arrow_down'),
//                         height: 14,
//                         width: 14,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                         specialization.length,
//                         (i) => Padding(
//                               padding: EdgeInsets.only(bottom: 20),
//                               child: RememberMe(
//                                 onCheck: (bool b) {},
//                                 content: specialization[i],
//                               ),
//                             )),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomButton(
//                     onPressed: () {},
//                     title: 'Reset',
//                     hasShadow: true,
//                     color: AppColors.yWhiteColor,
//                     textColor: kPrimaryColor,
//                     horizontalPadding: 40,
//                     weight: FontWeight.w600,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   CustomButton(
//                     onPressed: () {
//                       MagicRouter.pop();
//                     },
//                     title: 'Apply Now',
//                     weight: FontWeight.w600,
//                     horizontalPadding: 40,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
