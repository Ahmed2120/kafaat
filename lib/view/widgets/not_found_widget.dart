import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
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
              getAsset('not_found'),
              width: context.width / 3,
            ),
          ),
          const SizedBox(height: 20),
          const MainText(
            text: 'No results found',
            font: 18,
            weight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          const MainText(
            text:
                'The search could not be found, please check spelling or write another word.',
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
