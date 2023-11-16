import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/employer_details_model.dart';
import 'package:kafaat/models/employers_model.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class EmployersProvider extends ChangeNotifier {
  static EmployersProvider get(context) =>
      Provider.of<EmployersProvider>(context);

  static EmployersProvider listenFalse(context) =>
      Provider.of<EmployersProvider>(context, listen: false);

  DataStatus? employersStatus;
  DataStatus? employerDetailsStatus;
  EmployerModel? employerModel;
  EmployerDetailModel? employerDetailModel;

  EmployerFilters? employerFilters;

  Future<void> employers({bool retry = false}) async {
    try {
      employersStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          AppStrings.employerEndPoint +
              (employerFilters != null ? employerFilters!.toStr() : ''),
          withAuth: true);
      if (r['error'] == true) {
        employersStatus = DataStatus.error;
      } else {
        employerModel = EmployerModel.fromJson(r['data']);
        employersStatus = DataStatus.successed;
      }
    } catch (e) {
      employersStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> employerDetails(String slug, {bool retry = false}) async {
    try {
      employerDetailsStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          '${AppStrings.employerEndPoint}/$slug',
          withAuth: true,
          withLoading: true);
      if (r['error'] == true) {
        employerDetailsStatus = DataStatus.error;
      } else {
        employerDetailModel = EmployerDetailModel.fromJson(r['data']);
        employerDetailsStatus = DataStatus.successed;
      }
    } catch (e) {
      employerDetailsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

 }
