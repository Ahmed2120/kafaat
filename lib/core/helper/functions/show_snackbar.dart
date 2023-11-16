import 'package:kafaat/core/core_exports.dart';

showSnackbar(String message, {bool error = false}) {
  ScaffoldMessenger.of(NavigationService.currentContext).showSnackBar(
    SnackBar(
      content: Text(
        message,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: error ? AppColors.yRedColor : AppColors.yGreenColor,
    ),
  );
}

Future<void> closeSnackbar(int afterSeconds) async {
  await Future.delayed(Duration(seconds: afterSeconds), () {
    ScaffoldMessenger.of(NavigationService.currentContext).clearSnackBars();
  });
}
