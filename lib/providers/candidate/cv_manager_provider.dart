import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/cv_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class CVManagerProvider extends ChangeNotifier {
  static CVManagerProvider get(context) =>
      Provider.of<CVManagerProvider>(context);

  static CVManagerProvider listenFalse(context) =>
      Provider.of<CVManagerProvider>(context, listen: false);

  DataStatus? cvManagerStatus;
  DataStatus? deleteCVStatus;
  DataStatus? downloadCVStatus;
  CVModel? cvManagerModel;
  File? cvFile;

  Future<void> cvManager({bool retry = false, bool withLoading = true}) async {
    try {
      if (retry) {
        cvManagerStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(AppStrings.cvManagerEndPoint,
          withAuth: true, withLoading: withLoading);
      print(r);
      if (r['error'] == true) {
        cvManagerStatus = DataStatus.error;
      } else {
        cvManagerModel = CVModel.fromJson(r);
        cvManagerStatus = DataStatus.successed;
      }
    } catch (e) {
      cvManagerStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  int? currentId;
  Future<void> deleteCV(int cvId, {bool retry = true}) async {
    try {
      if (retry) {
        currentId = cvId;
        deleteCVStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest(
          AppStrings.deleteCVEndPoint, {'cv_id': cvId},
          withAuth: true);
      if (r['error'] == true) {
        deleteCVStatus = DataStatus.error;
        currentId = null;
      } else {
        await cvManager(withLoading: false);
        deleteCVStatus = DataStatus.successed;
        currentId = null;
      }
    } catch (e) {
      deleteCVStatus = DataStatus.error;
      log(e.toString());
      currentId = null;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> setCVDefault(int cvId, {bool retry = false}) async {
    try {
      if (retry) {
        deleteCVStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest(
          AppStrings.setDefaultCVEndPoint, {'cv_id': cvId},
          withAuth: true, withLoading: true);
      if (r['error'] == true) {
        deleteCVStatus = DataStatus.error;
      } else {
        await cvManager(withLoading: false);
        deleteCVStatus = DataStatus.successed;
      }
    } catch (e) {
      deleteCVStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> uploadCV({bool retry = true}) async {
    try {
      if (retry) {
        deleteCVStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.uploadFile(
          cvFile!, AppStrings.baseUrl + AppStrings.uploadCVEndPoint, 'cv_file',
          withLoading: true);
      print(r.body);

      if (jsonDecode(r.body)['error'] == false) {
        await cvManager(withLoading: false);
        cvFile = null;
        showSnackbar('CV File has been uploaded successfully');
        deleteCVStatus = DataStatus.successed;
      } else {
        deleteCVStatus = DataStatus.error;
      }
    } catch (e) {
      deleteCVStatus = DataStatus.error;
      log(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  ///
  /// Download
  ///

  bool isPermission = false;
  int? percentage;
  String? currentFileName;

  Future<void> download(String? url, String? fileName) async {
    if (url != null && fileName != null) {
      downloadCVStatus = DataStatus.loading;
      isPermission = await checkPermission();
      String dir = await getPath();
      currentFileName = fileName;
      notifyListeners();
      Dio dio = Dio();
      try {
        await dio.download(
          url,
          '$dir/${url.split('/').last}',
          onReceiveProgress: (count, total) {
            percentage = ((count / total) * 100).floor();
            notifyListeners();
          },
        ).then((value) {
          currentFileName = null;
          percentage = null;
          downloadCVStatus = DataStatus.successed;
          notifyListeners();
        });
      } catch (e) {
        currentFileName = null;
        percentage = null;
        downloadCVStatus = DataStatus.error;
        notifyListeners();
      }
    }
  }

  Future<String> getPath() async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final filePath = Directory("${tempDir!.path}/Downloads");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }

  Future<bool> checkPath(String? fileName) async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final directory = Directory("${tempDir!.path}/Downloads");

    if (!await directory.exists()) {
      return false;
    }

    File file = File(path.join(directory.path, fileName));
    bool isExist = await file.exists();
    return isExist && currentFileName != fileName;
  }

  Future<bool> checkPermission() async {
    var isStorage = await Permission.storage.status;
    if (!isStorage.isGranted) {
      await Permission.storage.request();
      if (!isStorage.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
