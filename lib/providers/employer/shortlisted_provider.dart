import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/shortlisted_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class ShortlistedProvider extends ChangeNotifier {
  static ShortlistedProvider get(context) =>
      Provider.of<ShortlistedProvider>(context);

  static ShortlistedProvider listenFalse(context) =>
      Provider.of<ShortlistedProvider>(context, listen: false);

  DataStatus? shortlistedStatus;
  ShortlistModel? shortlistedModel;

  Future<void> shortlisted({String keyword = '', bool retry = false}) async {
    try {
      if (retry) {
        shortlistedStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          (keyword.isNotEmpty)
              ? '${AppStrings.shortlistedEndPoint}?s=$keyword'
              : AppStrings.shortlistedEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        shortlistedStatus = DataStatus.error;
      } else {
        shortlistedModel = ShortlistModel.fromJson(r['data']);
        shortlistedStatus = DataStatus.successed;
      }
    } catch (e) {
      shortlistedStatus = DataStatus.error;
      log(e.toString());
    }
    notifyListeners();
  }
}
