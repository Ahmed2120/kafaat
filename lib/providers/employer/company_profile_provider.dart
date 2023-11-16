import 'dart:convert';
import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/company_profile_model.dart';
import 'package:kafaat/models/user_profile_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class CompanyProfileProvider extends ChangeNotifier {
  static CompanyProfileProvider get(context) =>
      Provider.of<CompanyProfileProvider>(context);

  static CompanyProfileProvider listenFalse(context) =>
      Provider.of<CompanyProfileProvider>(context, listen: false);

  DataStatus? companyProfileStatus;
  DataStatus? updateCompanyProfileStatus;
  CompanyModel? companyProfileModel;

  Future<void> companyProfile({bool retry = false}) async {
    try {
      companyProfileStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.companyProfileEndPoint,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        companyProfileStatus = DataStatus.error;
      } else {
        companyProfileModel = CompanyModel.fromJson(r['data']);
        companyProfileStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> updateCompanyProfile(CompanyModel profile,
      {bool retry = false}) async {
    try {
      updateCompanyProfileStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      if (profile.company!.email == null ||
          !profile.company!.email!.isValidEmail) {
        showSnackbar('Please Enter an Email!', error: true);
        return Future.value();
      }
      if (profile.company?.name == null || profile.company!.name!.isEmpty) {
        showSnackbar('Please Enter a Name!', error: true);
        return Future.value();
      }
      if (profile.company?.phone == null || profile.company!.phone!.isEmpty) {
        showSnackbar('Please Enter a Phone!', error: true);
        return Future.value();
      }
      if (profile.company?.locationId == null) {
        showSnackbar('Please Select a Location!', error: true);
        return Future.value();
      }
      Map<String, dynamic> body = {
        'name': profile.company?.name,
        'email': profile.company?.email,
        'phone': profile.company?.phone,
        'location_id': profile.company?.locationId,
        'website': profile.company?.website,
        'category_id': profile.company?.categoryId,
        'about': profile.company?.about,
        'city': profile.company?.city,
        'country': profile.company?.country,
        'address': profile.company?.address,
        'team_size': profile.company?.teamSize,
        'zip_code': profile.company?.zipCode,
        'map_lat': profile.company?.mapLat,
        'map_lng': profile.company?.mapLng,
        'map_zoom': profile.companyLocation
            ?.firstWhere((loc) => loc.id == profile.company?.locationId,
                orElse: () => CompanyLocation())
            .mapZoom,
        'status': profile.company?.status,
      };
      var r = await RemoteData.postRequest(
          AppStrings.updateCompanyProfileEndPoint, body,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        updateCompanyProfileStatus = DataStatus.error;
      } else {
        showSnackbar('Data is Updated successfully');
        UserProfileModel userProfileData = LocalData.userProfileData;
        userProfileData.name = profile.company?.name;
        userProfileData.email = profile.company?.email;
        await LocalData.setString(
            LocalKeys.userProfileData, jsonEncode(userProfileData.toJson()));
        updateCompanyProfileStatus = DataStatus.successed;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
