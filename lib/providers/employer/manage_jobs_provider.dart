import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/manage_jobs_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class ManageJobsProvider extends ChangeNotifier {
  static ManageJobsProvider get(context) =>
      Provider.of<ManageJobsProvider>(context);

  static ManageJobsProvider listenFalse(context) =>
      Provider.of<ManageJobsProvider>(context, listen: false);

  DataStatus? manageJobsStatus;
  ManageJobModel? manageJobModel;

  Future<void> manageJobs({String keyword = '', bool retry = false}) async {
    try {
      manageJobsStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          (keyword.isNotEmpty)
              ? '${AppStrings.manageJobsEndPoint}?s=$keyword'
              : AppStrings.manageJobsEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        manageJobsStatus = DataStatus.error;
      } else {
        manageJobModel = ManageJobModel.fromJson(r['data']);
        manageJobsStatus = DataStatus.successed;
      }
    } catch (e) {
      manageJobsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
