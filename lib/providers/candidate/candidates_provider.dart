import 'dart:convert';
import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/candidate_details_model.dart';
import 'package:kafaat/models/candidates_model.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class CandidatesProvider extends ChangeNotifier {
  static CandidatesProvider get(context) =>
      Provider.of<CandidatesProvider>(context);

  static CandidatesProvider listenFalse(context) =>
      Provider.of<CandidatesProvider>(context, listen: false);

  DataStatus? candidatesStatus;
  DataStatus? candidateDetailsStatus;
  CandidateModel? candidateModel;
  CandidateDetailModel? candidateDetailModel;
  CandidateFilters? candidateFilters;
  Future<void> candidates({bool retry = false}) async {
    try {
      candidatesStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          AppStrings.candidateEndPoint +
              (candidateFilters != null ? candidateFilters!.toStr() : ''),
          withAuth: true);
      if (r['error'] == true) {
        candidatesStatus = DataStatus.error;
      } else {
        candidateModel = CandidateModel.fromJson(r['data']);
        log(jsonEncode(candidateModel!));
        candidatesStatus = DataStatus.successed;
      }
    } catch (e) {
      candidatesStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> candidateDetails(String slug, {bool retry = false}) async {
    try {
      candidateDetailsStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          '${AppStrings.candidateEndPoint}/$slug',
          withAuth: true,
          withLoading: true);
      if (r['error'] == true) {
        candidateDetailsStatus = DataStatus.error;
      } else {
        candidateDetailModel = CandidateDetailModel.fromJson(r['data']);
        candidateDetailsStatus = DataStatus.successed;
      }
    } catch (e) {
      candidateDetailsStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
