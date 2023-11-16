import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/plan_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class PlansProvider extends ChangeNotifier {
  static PlansProvider get(context) => Provider.of<PlansProvider>(context);

  static PlansProvider listenFalse(context) =>
      Provider.of<PlansProvider>(context, listen: false);

  DataStatus? plansStatus;
  DataStatus? buyPlanStatus;
  PlanModel? planModel;

  Future<void> plans({bool retry = false}) async {
    try {
      if (retry) {
        plansStatus = DataStatus.loading;
        notifyListeners();
      }
      var r =
          await RemoteData.getRequest(AppStrings.plansEndPoint, withAuth: true);
      if (r['error'] == true) {
        plansStatus = DataStatus.error;
      } else {
        planModel = PlanModel.fromJson(r['data']);
        plansStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> buyPlan(int id,
      {bool isAnnual = false, bool retry = false}) async {
    try {
      if (retry) {
        buyPlanStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          '${AppStrings.buyPlanEndPoint}/$id${isAnnual ? '?annual=1' : ''}',
          withAuth: true,
          withLoading: true);
      if (r['error'] == true) {
        buyPlanStatus = DataStatus.error;
        showSnackbar(r['messages'], error: true);
      } else {
        showSnackbar('Plan selected Successfully');

        Future.delayed(const Duration(seconds: 1), () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
        buyPlanStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
