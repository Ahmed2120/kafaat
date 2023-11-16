import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/loading_dialog.dart';


showLoading() {
  showDialog(
    context: NavigationService.currentContext,
    builder: (context) {
      return const LoadingDialog();
    },
  );
}
