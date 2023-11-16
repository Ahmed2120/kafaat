// import 'package:kafaat/core/core_exports.dart';
// import 'package:kafaat/models/plan_model.dart';
// import 'package:kafaat/view/widgets/main_text.dart';

// class ChoosePlanItem extends StatelessWidget {
//   final Function() onPress;
//   final PlanModel data;
//   final int current;

//   const ChoosePlanItem({
//     required this.onPress,
//     required this.data,
//     required this.current,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               width: 180,
//               // margin: EdgeInsets.only(right: 20),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//               decoration: BoxDecoration(
//                 boxShadow: current != data.id
//                     ? [
//                         BoxShadow(
//                           color: AppColors.yBlackColor.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset:
//                               const Offset(0, 3), 
//                         ),
//                       ]
//                     : null,
//                 borderRadius: BorderRadius.circular(12),
//                 color: current == data.id
//                     ? AppColors.yPrimaryColor
//                     : AppColors.yWhiteColor,
//               ),
//               // height: 204,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // data.image.contains('assets/images/')
//                   //     ? Image.asset(
//                   //         data.image,
//                   //         height: 48,
//                   //         width: 48,
//                   //       )
//                   //     : Image.network(
//                   //         data.image,
//                   //         height: 48,
//                   //         width: 48,
//                   //       ),
//                   const SizedBox(height: 15),
//                   MainText(
//                     text: data.title,
//                     font: 18,
//                     weight: FontWeight.w500,
//                     color: current == data.id
//                         ? AppColors.yWhiteColor
//                         : AppColors.ySecondary2Color,
//                   ),
//                   const SizedBox(height: 25),
//                   MainText(
//                     text:
//                         '${data.price}/${data.duration == 1 ? '' : data.duration}${data.durationType}',
//                     font: 16,
//                     weight: FontWeight.w400,
//                     color: current == data.id
//                         ? AppColors.yWhiteColor
//                         : AppColors.yBodyColor,
//                   ),
//                   const SizedBox(height: 15),
//                 ],
//               ),
//             ),
//           ),
//           current == data.id
//               ? Padding(
//                   padding: const EdgeInsets.only(top: 8, right: 12),
//                   child: Image.asset(
//                     getAsset('correct_icon'),
//                     height: 32,
//                     width: 32,
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
