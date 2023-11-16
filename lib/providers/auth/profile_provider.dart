import 'dart:convert';
import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/user_profile_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  static ProfileProvider get(context) => Provider.of<ProfileProvider>(context);

  static ProfileProvider listenFalse(context) =>
      Provider.of<ProfileProvider>(context, listen: false);

  DataStatus? profileStatus;

  UserProfileModel? userProfileModel;

  Future<DataStatus> profile(
      {bool loading = true, bool withLoading = false}) async {
    notifyListeners();
    try {
      if (loading) {
        profileStatus = DataStatus.loading;
        notifyListeners();
      }
      var data = await RemoteData.getRequest(AppStrings.profileEndPoint,
          withLoading: withLoading);
      if (data.containsKey('id')) {
        LocalData.setString(LocalKeys.userProfileData, jsonEncode(data));
        userProfileModel = UserProfileModel.fromJson(data);
        profileStatus = DataStatus.successed;
      } else {
        showSnackbar('Error', error: true);
        profileStatus = DataStatus.failed;
      }
    } catch (e) {
      log(e.toString());
      showSnackbar(e.toString(), error: true);
      profileStatus = DataStatus.error;
    }
    notifyListeners();
    return profileStatus ?? DataStatus.error;
  }
}
