import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/my_orders_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class MyOrdersProvider extends ChangeNotifier {
  static MyOrdersProvider get(context) =>
      Provider.of<MyOrdersProvider>(context);

  static MyOrdersProvider listenFalse(context) =>
      Provider.of<MyOrdersProvider>(context, listen: false);

  DataStatus? myOrdersStatus;
  MyOrdersModel? orderModel;

  Future<void> myOrders({String keyword = '', bool retry = true}) async {
    try {
      if (retry) {
        myOrdersStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          (keyword.isNotEmpty)
              ? '${AppStrings.myOrdersEndPoint}?s=$keyword'
              : AppStrings.myOrdersEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        myOrdersStatus = DataStatus.error;
      } else {
        orderModel = MyOrdersModel.fromJson(r);
        myOrdersStatus = DataStatus.successed;
      }
    } catch (e) {
      myOrdersStatus = DataStatus.error;
      log(e.toString());
    }
    notifyListeners();
  }
}
