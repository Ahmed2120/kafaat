 import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_text.dart';

DataColumn customDataColumn(String title) {
    return DataColumn(
      label: Container(
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.yPrimaryColor.withOpacity(0.24),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: MainText(
            text: title,
            color: AppColors.yPrimaryColor,
            font: 15,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
