import 'package:flutter/material.dart';
import 'package:kafaat/core/constants/app_colors.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 120),
        backgroundColor: AppColors.yPrimaryColor.withOpacity(0.01),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingWidget()],
          ),
        ),
      ),
    );
  }
}
