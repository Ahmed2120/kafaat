import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback retryCallback;

  const RetryWidget({required this.retryCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MainText(
            text: 'An error has occurred please try again',
            font: 18,
            weight: FontWeight.bold,
            color: AppColors.ySecondaryColor,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: retryCallback,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.ySecondaryColor,
              ),
            ),
            child: const MainText(
              text: 'Try Again',
              font: 16,
              color: AppColors.yWhiteColor,
              weight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
