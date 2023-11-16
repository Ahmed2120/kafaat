import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Image.asset(
              getAsset('success'),
              width: context.width / 3,
            ),
          ),
          const SizedBox(height: 20),
          const MainText(
            text: 'Successful',
            font: 18,
            weight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          const MainText(
            text: 'Congratulations, your application has been sent',
            font: 14,
            weight: FontWeight.w400,
            textAlign: TextAlign.center,
            color: AppColors.yBodyColor,
          ),
        ],
      ),
    );
  }
}
