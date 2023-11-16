import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/create_jobs_model.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class AddNewJobProvider extends ChangeNotifier {
  static AddNewJobProvider get(context) =>
      Provider.of<AddNewJobProvider>(context);

  static AddNewJobProvider listenFalse(context) =>
      Provider.of<AddNewJobProvider>(context, listen: false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DataStatus? addNewJobStatus;

  // Var
  String? title;
  String? content;
  TextEditingController expDateController = TextEditingController();
  String? hours;
  String? hoursType;
  String? salaryMin;
  String? salaryMax;
  String? salaryType;
  bool isWageAgree = false;
  String? gender;
  String? experience;
  String? numberRecruitments;
  String? vedioUrl;
  int? vedioImageId;
  int? locationId;
  TextEditingController latController = TextEditingController()..text = '30.0';
  TextEditingController longController = TextEditingController()..text = '30.0';
  TextEditingController zoomController = TextEditingController()..text = '12';
  String? status;
  bool isUrgent = false;
  bool isFeatured = false;
  int? categoryId;
  int? jobTypeId;
  Set<int> jobSkills = {};
  String? company;
  String? companyLogo;
  int? featuredImageId;
  String? seoTitle;
  String? seoDes;
  String? seoImage;
  String? facebook;
  String? twitter;

  File? imageFile;
  File? featuredImageFile;
  File? seoImageFile;
  File? companyImageFile;

  bool isVideoImageUploaded = false;
  bool isFeaturedImageUploaded = false;
  bool isSeoImageUploaded = false;
  bool isCompanyImageUploaded = false;

  Future<void> addNewJob({bool retry = false}) async {
    if (title == null ||
        title!.isEmpty ||
        jobTypeId == null ||
        categoryId == null ||
        locationId == null ||
        expDateController.text.isEmpty) {
      showSnackbar('Please Enter valid Inputs', error: true);
    }

    // upload files
    if (imageFile != null) {
      await RemoteData.uploadImage(imageFile!, withLoading: true).then((res) {
        var bodyRes = jsonDecode(res.body);
        if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
          vedioImageId = bodyRes['data']['id'];
          isVideoImageUploaded = true;
        }
      });
    }
    if (featuredImageFile != null) {
      await RemoteData.uploadImage(featuredImageFile!, withLoading: true)
          .then((res) {
        var bodyRes = jsonDecode(res.body);
        if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
          featuredImageId = bodyRes['data']['id'];
          isFeaturedImageUploaded = true;
        }
      });
    }
    if (seoImageFile != null) {
      await RemoteData.uploadImage(seoImageFile!, withLoading: true)
          .then((res) {
        var bodyRes = jsonDecode(res.body);
        if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
          seoImage = bodyRes['data']['file_path'];
          isSeoImageUploaded = true;
        }
      });
    }
    // if (companyImageFile != null) {
    //   await RemoteData.uploadImage(companyImageFile!, withLoading: true)
    //       .then((res) {
    //     var bodyRes = jsonDecode(res.body);
    //     if (res.statusCode == 200 && bodyRes['uploaded'] == 1) {
    //       companyLogo = bodyRes['data']['file_path'];
    //       isCompanyImageUploaded = true;
    //     }
    //   });
    // }
    if ((imageFile == null || isVideoImageUploaded) &&
        (featuredImageFile == null || isFeaturedImageUploaded) &&
        (seoImageFile == null || isSeoImageUploaded) &&
        (companyImageFile == null || isCompanyImageUploaded)) {
      Map<String, dynamic> body = {
        'title': title,
        'job_type_id': jobTypeId,
        'category_id': categoryId,
        'location_id': locationId,
        'expiration_date': expDateController.text,
        'salary_max': salaryMax,
        'salary_min': salaryMin,
        'content': content,
        'hours': hours,
        'hours_type': hoursType,
        'gender': gender,
        'salary_type': salaryType,
        'wage_agreement': isWageAgree,
        'experience': experience,
        'number_recruitments': numberRecruitments,
        'video': vedioUrl,
        'video_cover_id': vedioImageId,
        'map_lat': latController.text,
        'map_lng': longController.text,
        'map_zoom': zoomController.text,
        'thumbnail_id': featuredImageId,
        'seo_title': seoTitle,
        'seo_desc': seoDes,
        'seo_image': seoImage,
        'job_skills': jobSkills.toList(),
        'is_featured': isFeatured,
        'is_urgent': isUrgent,
        'status': status == null ? 'publish' : status!.toLowerCase(),
      };
      log(body.toString());
      try {
        if (retry) {
          addNewJobStatus = DataStatus.loading;
          notifyListeners();
        }
        var r = await RemoteData.postRequest(AppStrings.addNewJobEndPoint, body,
            withAuth: true, withLoading: true);
        if (r['error'] == true) {
          addNewJobStatus = DataStatus.error;
        } else {
          showSnackbar('Job is added successfuly');
          addNewJobStatus = DataStatus.successed;
          Future.delayed(const Duration(seconds: 1), () async {
            imageFile = null;
            featuredImageFile = null;
            seoImageFile = null;
            companyImageFile = null;
            isVideoImageUploaded = false;
            isFeaturedImageUploaded = false;
            isSeoImageUploaded = false;
            isCompanyImageUploaded = false;
            AppRoutes.routeRemoveAllTo(
                NavigationService.currentContext, const EmployerHomePage());
          });
        }
      } catch (e) {
        log(e.toString());
      }
      notifyListeners();
    } else {
      showSnackbar('Images Files Uploaded Error, Try Again!', error: true);
    }
  }

  //
  DataStatus? createJobDataStatus;
  CreateJobModel? createJobModel;

  Future<void> getAllData({bool retry = false}) async {
    try {
      createJobDataStatus = DataStatus.loading;
      if (retry) {
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.createJobEndPoint,
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        createJobDataStatus = DataStatus.error;
      } else {
        createJobModel = CreateJobModel.fromJson(r['data']);
        createJobDataStatus = DataStatus.successed;
      }
    } catch (e) {
      createJobDataStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
