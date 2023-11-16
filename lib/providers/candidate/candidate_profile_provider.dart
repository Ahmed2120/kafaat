import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/candidate_profile_model.dart';
import 'package:kafaat/models/user_profile_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class CandidateProfileProvider extends ChangeNotifier {
  static CandidateProfileProvider get(context) =>
      Provider.of<CandidateProfileProvider>(context);

  static CandidateProfileProvider listenFalse(context) =>
      Provider.of<CandidateProfileProvider>(context, listen: false);

  DataStatus? candidateProfileStatus;
  DataStatus? updateCandidateProfileStatus;
  CandidateProfile? candidateProfileModel;

  Future<void> candidateProfile({bool retry = false}) async {
    try {
      candidateProfileStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.candidateProfileEndPoint,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        candidateProfileStatus = DataStatus.error;
      } else {
        candidateProfileModel = CandidateProfile.fromJson(r['data']);
        candidateProfileStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> becomeCompany({bool retry = false}) async {
    try {
      candidateProfileStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.upgradeCompanyEndPoint,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        candidateProfileStatus = DataStatus.error;
      } else {
        candidateProfileStatus = DataStatus.successed;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  File? videoImageFile;
  List<File>? galleryFiles;
  File? seoImageFile;
  File? avatarImageFile;

  Future<void> updateCandidateProfile(CandidateProfile profile,
      {bool retry = false}) async {
    try {
      updateCandidateProfileStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      if (profile.user?.firstName == null ||
          profile.user!.firstName!.isEmpty ||
          profile.user!.lastName == null ||
          profile.user!.lastName!.isEmpty ||
          profile.profile?.title == null ||
          profile.profile!.title!.isEmpty ||
          profile.profile!.locationId == null) {
        showSnackbar('Please Enter a correct Data!', error: true);
        return Future.value();
      }

      if (videoImageFile != null) {
        await RemoteData.uploadImage(videoImageFile!, withLoading: true)
            .then((res) {
          var bodyRes = jsonDecode(res.body);
          if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
            profile.profile?.videoCoverId =
                bodyRes['data']['id'].toString().toIntNum;
          }
        });
        videoImageFile = null;
      }
      if (seoImageFile != null) {
        await RemoteData.uploadImage(seoImageFile!, withLoading: true)
            .then((res) {
          var bodyRes = jsonDecode(res.body);
          if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
            profile.seo?.seoImage = bodyRes['data']['id'].toString().toIntNum;
          }
        });
        seoImageFile = null;
      }
      if (avatarImageFile != null) {
        await RemoteData.uploadImage(avatarImageFile!, withLoading: true)
            .then((res) {
          var bodyRes = jsonDecode(res.body);
          if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
            profile.user?.avatarId = bodyRes['data']['id'].toString().toIntNum;
          }
        });
        avatarImageFile = null;
      }
      if (galleryFiles != null) {
        List<int> galleryIds = (profile.profile?.gallery?.split(',') ?? [])
            .map((item) => item.toString().toIntNum)
            .toList();
        for (File image in galleryFiles!) {
          await RemoteData.uploadImage(image, withLoading: true).then((res) {
            var bodyRes = jsonDecode(res.body);
            if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
              galleryIds.add(bodyRes['data']['id'].toString().toIntNum);
            }
          });
        }
        profile.profile?.gallery = galleryIds.join(',');
        galleryFiles = null;
      }
      Map<String, dynamic> body = {
        'first_name': profile.user?.firstName,
        'last_name': profile.user?.lastName,
        'title': profile.profile?.title,
        'website': profile.profile?.website,
        'gender': profile.profile?.gender,
        'expected_salary': profile.profile?.expectedSalary,
        'salary_type': profile.profile?.salaryType,
        'experience_year': profile.profile?.experienceYear,
        'education_level': profile.profile?.educationLevel,
        'languages': profile.profile?.languages?.split(',') ?? [],
        'video': profile.profile?.video,
        'avatar_id': profile.user?.avatarId,
        'bio': profile.user?.bio,
        'gallery': (profile.profile?.gallery?.split(',') ?? [])
            .map((item) => item.toString().toIntNum)
            .toList(),
        'allow_search': profile.profile?.allowSearch,
        'address': profile.profile?.address,
        'city': profile.profile?.city,
        'country': profile.profile?.country,
        'location_id': profile.profile?.locationId,
        'map_lat': profile.profile?.mapLat,
        'map_lng': profile.profile?.mapLng,
        'map_zoom': profile.locations!
            .firstWhere((loc) => loc.id == profile.profile?.locationId)
            .mapZoom,
        'video_cover_id': profile.profile?.videoCoverId,
        'cvs': profile.cvs?.map((e) => e.id).toList(),
        'csv_default': profile.cvs
            ?.firstWhere(
              (element) => element.isDefault == 1,
              orElse: () => Cvs(),
            )
            .id,
        'skills': profile.userskills?.map((e) => e.id).toList(),
        'categories': profile.usercategories?.map((e) => e.id).toList(),
        'seo_title': profile.seo?.seoTitle,
        'seo_desc': profile.seo?.seoDesc,
        'seo_image': profile.seo?.seoImage,
      };
      body['education'] = [];
      body['award'] = [];
      body['experience'] = [];
      for (int i = 0; i < (profile.profile?.experience?.length ?? 0); i++) {
        (body['experience'] as List)
            .add(profile.profile?.experience?[i].toJson());
      }
      for (int i = 0; i < (profile.profile?.education?.length ?? 0); i++) {
        (body['education'] as List)
            .add(profile.profile?.education?[i].toJson());
      }
      for (int i = 0; i < (profile.profile?.award?.length ?? 0); i++) {
        (body['award'] as List).add(profile.profile?.award?[i].toJson());
      }
      body.addAll({'social_media': profile.profile?.socialMedia?.toJson()});

      log(body.toString());
      var r = await RemoteData.postRequest(
          AppStrings.updateCandidateProfileEndPoint, body,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        updateCandidateProfileStatus = DataStatus.error;
      } else {
        showSnackbar(r['messages']);
        UserProfileModel userProfileData = LocalData.userProfileData;
        userProfileData.name = r['data']['name'];
        userProfileData.firstName = r['data']['first_name'];
        userProfileData.lastName = r['data']['last_name'];
        userProfileData.email = r['data']['email'];
        await LocalData.setString(
            LocalKeys.userProfileData, jsonEncode(userProfileData.toJson()));
        updateCandidateProfileStatus = DataStatus.successed;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
