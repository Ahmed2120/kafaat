import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/categories_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class CategoriesProvider extends ChangeNotifier {
  static CategoriesProvider get(context) =>
      Provider.of<CategoriesProvider>(context);

  static CategoriesProvider listenFalse(context) =>
      Provider.of<CategoriesProvider>(context, listen: false);

  DataStatus? categoriesStatus;
  CategoriesModel? categoriesModel;

  Future<void> categories(
      {String keyword = '', bool retry = false}) async {
    try {
      if (retry) {
        categoriesStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          (keyword.isNotEmpty)
              ? '${AppStrings.categoriesEndPoint}?s=$keyword'
              : AppStrings.categoriesEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        categoriesStatus = DataStatus.error;
      } else {
        categoriesModel = CategoriesModel.fromJson(r);
        categoriesStatus = DataStatus.successed;
      }
    } catch (e) {
      categoriesStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
