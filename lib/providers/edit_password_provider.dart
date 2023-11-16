import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/profile_provider.dart';
export 'package:provider/provider.dart';

class EditPasswordProvider extends ChangeNotifier {
  static EditPasswordProvider get(context) =>
      Provider.of<EditPasswordProvider>(context);

  static EditPasswordProvider listenFalse(context) =>
      Provider.of<EditPasswordProvider>(context, listen: false);

  DataStatus? editStatus;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  Future<void> editPassword({bool loading = true}) async {
    try {
      Map<String, dynamic> body = {
        'current-password': currentPasswordController.text,
        'new-password': newPasswordController.text,
        'new-password_confirmation': confirmNewPasswordController.text,
      };
      if (loading) {
        editStatus = DataStatus.loading;
        notifyListeners();
      }
      var data = await RemoteData.postRequest(
          AppStrings.changePasswordEndPoint, body,
          withAuth: true, withLoading: true);
      if (data['error'] == false) {
        editStatus = DataStatus.successed;
        showSnackbar((data['message'] ?? data['messages']).toString());
      } else {
        showSnackbar((data['message'] ?? data['messages']).toString(),
            error: true);
        editStatus = DataStatus.failed;
      }
    } catch (e) {
      log(e.toString());
      showSnackbar(e.toString(), error: true);
      editStatus = DataStatus.error;
    }
    notifyListeners();
  }
}
