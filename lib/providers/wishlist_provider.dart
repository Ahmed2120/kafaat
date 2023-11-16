import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/wishlists_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class WishlistsProvider extends ChangeNotifier {
  static WishlistsProvider get(context) =>
      Provider.of<WishlistsProvider>(context);

  static WishlistsProvider listenFalse(context) =>
      Provider.of<WishlistsProvider>(context, listen: false);

  DataStatus? addWishlistStatus;
  DataStatus? wishlistsStatus;
  WishlistsModel? wishlistsModel;

  int? currentId;
  String? currentModel;
  Future<void> addWishlist(int id,
      {String objectModel = 'job', bool retry = true}) async {
    try {
      if (retry) {
        currentId = id;
        currentModel = objectModel;
        addWishlistStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest(AppStrings.addWishlistEndPoint,
          {'object_id': id, 'object_model': objectModel},
          withAuth: true);
      print(r);
      if (r['error'] == true) {
        addWishlistStatus = DataStatus.error;
      } else {
        await allWishlists().then((value) {
          addWishlistStatus = DataStatus.successed;
        });
        addWishlistStatus = DataStatus.successed;
      }
    } catch (e) {
      currentId = null;
      currentModel = null;
      addWishlistStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    currentId = null;
    currentModel = null;
    notifyListeners();
  }

  Future<void> allWishlists({bool retry = true}) async {
    try {
      if (retry) {
        wishlistsStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.wishlistsEndPoint,
          withAuth: true);
      print(r);
      if (r['error'] == true) {
        wishlistsStatus = DataStatus.error;
      } else {
        wishlistsModel = WishlistsModel.fromJson(r);
        wishlistsStatus = DataStatus.successed;
      }
    } catch (e) {
      wishlistsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  bool isWishlisted(int id, String objectModel) {
    if (wishlistsModel == null) {
      return false;
    }
    for (var item in wishlistsModel!.wishlists!) {
      if (item.objectModel == objectModel && item.objectId == id) {
        return true;
      }
    }
    return false;
  }
}
