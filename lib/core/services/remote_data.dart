import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/pages/auth/login/login_page.dart';

class RemoteData {
  static final RemoteData _instance = RemoteData._internal();
  factory RemoteData() => _instance;
  RemoteData._internal();

  static Map<String, String> get headers =>
      {'Content-Type': 'application/json'};
  static Map<String, String> get headersAuth => {
        'Authorization': 'Bearer ${LocalData.userLoginData.token}',
        'Content-Type': 'application/json'
      };
  static Map<String, String> get headersGetAuth => {
        'Authorization': 'Bearer ${LocalData.userLoginData.token}',
      };
  static Map<String, String> get fileHeaders => {
        "Content-type": "multipart/form-data",
        'Accept-Language': 'ar',
        'Accept': 'application/json',
        "AppToken": '${LocalData.userLoginData.token}',
        'Authorization': 'Bearer ${LocalData.userLoginData.token}',
      };
  static int loggedout = 0;
  static Future<Map<String, dynamic>> getRequest(String endPoint,
      {bool withAuth = true, bool withLoading = false}) async {
    try {
      if (withLoading) showLoading();
      var response = await http.get(
        Uri.parse(AppStrings.baseUrl + endPoint),
        headers: withAuth ? headersGetAuth : headers,
      );
      print(response.body);
      Map<String, dynamic> responseBody =
          json.decode(response.body) as Map<String, dynamic>;
      // log(responseBody.toString());
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      try {
        if (responseBody['message'].toString().contains('Unauthenticated')) {
          loggedout++;
          showSnackbar('You are logged out, User need to login again',
              error: true);
          if (loggedout > 2) {
            Future.delayed(Duration.zero, () async {
              AppRoutes.routeRemoveAllTo(
                  NavigationService.currentContext, const LoginPage());
            });
          }
        } else {
          loggedout = 0;
        }
      } catch (e) {
        loggedout = 0;
        log(e.toString());
      }
      return responseBody;
    } catch (e) {
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      throw Exception(e.toString());
    }
  }

  static Future<Map<String, dynamic>> getBodyRequest(
      String endPoint, Map<String, dynamic> body,
      {bool withAuth = true, bool withLoading = false}) async {
    if (withLoading) showLoading();
    var request = http.Request(
      'GET',
      Uri.parse(AppStrings.baseUrl + endPoint),
    );
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String resBody = await response.stream.bytesToString();
    // log(resBody);
    Map<String, dynamic> responseBody =
        json.decode(resBody) as Map<String, dynamic>;
    if (withLoading) {
      Future.delayed(Duration.zero, () async {
        AppRoutes.pop(NavigationService.currentContext);
      });
    }
    try {
      if (responseBody['message'].toString().contains('Unauthenticated')) {
        loggedout++;
        showSnackbar('You are logged out, User need to login again',
            error: true);
        if (loggedout > 2) {
          Future.delayed(Duration.zero, () async {
            AppRoutes.routeRemoveAllTo(
                NavigationService.currentContext, const LoginPage());
          });
        }
      } else {
        loggedout = 0;
      }
    } catch (e) {
      loggedout = 0;
      log(e.toString());
    }
    return responseBody;
  }

  static Future<Map<String, dynamic>> postRequest(
      String endPoint, Map<String, dynamic> body,
      {bool withAuth = false, bool withLoading = false}) async {
    try {
      if (withLoading) showLoading();
      var response = await http.post(
        Uri.parse(AppStrings.baseUrl + endPoint),
        body: json.encode(body),
        headers: withAuth ? headersAuth : headers,
      );
      log(response.body);
      Map<String, dynamic> responseBody =
          json.decode(response.body) as Map<String, dynamic>;
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      try {
        if (responseBody['message'].toString().contains('Unauthenticated')) {
          loggedout++;
          showSnackbar('You are logged out, User need to login again',
              error: true);
          if (loggedout > 2) {
            Future.delayed(Duration.zero, () async {
              AppRoutes.routeRemoveAllTo(
                  NavigationService.currentContext, const LoginPage());
            });
          }
        } else {
          loggedout = 0;
        }
      } catch (e) {
        loggedout = 0;
        log(e.toString());
      }
      return responseBody;
    } catch (e) {
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      throw Exception(e.toString());
    }
  }

  static Future<Response> uploadFile(File file, String url, String fieldname,
      {bool withLoading = false}) async {
    try {
      if (withLoading) showLoading();
      final request = MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(fileHeaders);
      request.files.add(await MultipartFile.fromPath(fieldname, file.path));
      final streamResponse = await request.send();
      Response r = await Response.fromStream(streamResponse);
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      try {
        if (jsonDecode(r.body)['message']
            .toString()
            .contains('Unauthenticated')) {
          loggedout++;
          showSnackbar('You are logged out, User need to login again',
              error: true);
          if (loggedout > 2) {
            Future.delayed(Duration.zero, () async {
              AppRoutes.routeRemoveAllTo(
                  NavigationService.currentContext, const LoginPage());
            });
          }
        } else {
          loggedout = 0;
        }
      } catch (e) {
        loggedout = 0;
        log(e.toString());
      }
      return r;
    } catch (e) {
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      throw Exception(e.toString());
    }
  }

  static Future<Response> uploadImage(File file,
      {bool withLoading = false}) async {
    try {
      if (withLoading) showLoading();
      final request = MultipartRequest('POST', Uri.parse(AppStrings.imageBase));
      request.headers.addAll(fileHeaders);
      request.files.add(await MultipartFile.fromPath('file', file.path));
      final streamResponse = await request.send();
      Response r = await Response.fromStream(streamResponse);
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      try {
        if (jsonDecode(r.body)['message']
            .toString()
            .contains('Unauthenticated')) {
          loggedout++;
          showSnackbar('You are logged out, User need to login again',
              error: true);
          if (loggedout > 2) {
            Future.delayed(Duration.zero, () async {
              AppRoutes.routeRemoveAllTo(
                  NavigationService.currentContext, const LoginPage());
            });
          }
        } else {
          loggedout = 0;
        }
      } catch (e) {
        loggedout = 0;
        log(e.toString());
      }
      return r;
    } catch (e) {
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      throw Exception(e.toString());
    }
  }

  static Future<Response> applyJob(
      File file, String message, int jobId, int companyId,
      {bool withLoading = false}) async {
    try {
      if (withLoading) showLoading();
      final request = MultipartRequest(
          'POST', Uri.parse(AppStrings.baseUrl + AppStrings.applyJobEndPoint));
      request.headers.addAll(fileHeaders);
      request.files.add(await MultipartFile.fromPath('cv_file', file.path));
      request.fields.addAll(
          {'message': message, 'job_id': '$jobId', 'company_id': '$companyId'});
      final streamResponse = await request.send();
      Response r = await Response.fromStream(streamResponse);
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      try {
        if (jsonDecode(r.body)['message']
            .toString()
            .contains('Unauthenticated')) {
          loggedout++;
          showSnackbar('You are logged out, User need to login again',
              error: true);
          if (loggedout > 2) {
            Future.delayed(Duration.zero, () async {
              AppRoutes.routeRemoveAllTo(
                  NavigationService.currentContext, const LoginPage());
            });
          }
        } else {
          loggedout = 0;
        }
      } catch (e) {
        loggedout = 0;
        log(e.toString());
      }
      return r;
    } catch (e) {
      if (withLoading) {
        Future.delayed(Duration.zero, () async {
          AppRoutes.pop(NavigationService.currentContext);
        });
      }
      throw Exception(e.toString());
    }
  }

  // static Future<Response> updateImage({
  //   required File imageFile,
  //   required String phoneNumber,
  //   required String path,
  // }) async {
  //   var request = MultipartRequest(
  //     'PUT',
  //     Uri.parse('${AppStrings.fileBase}$path'),
  //   );
  //   request.files.add(
  //     MultipartFile(
  //       'photo',
  //       imageFile.readAsBytes().asStream(),
  //       imageFile.lengthSync(),
  //       filename: imageFile.path.split('/').last,
  //     ),
  //   );
  //   request.fields['PhoneNumber'] = phoneNumber;
  //   request.headers.addAll(fileHeaders);
  //   var res = await request.send();
  //   Response r = await Response.fromStream(res);
  //   try {
  //     if (jsonDecode(r.body)['message']
  //         .toString()
  //         .contains('Unauthenticated')) {
  //       loggedout++;
  //       showSnackbar('You are logged out, User need to login again',
  //           error: true);
  //       if (loggedout > 2) {
  //         Future.delayed(Duration.zero, () async {
  //           AppRoutes.routeRemoveAllTo(
  //               NavigationService.currentContext, const LoginPage());
  //         });
  //       }
  //     } else {
  //       loggedout = 0;
  //     }
  //   } catch (e) {
  //     loggedout = 0;
  //     log(e.toString());
  //   }
  //   return r;
  // }
}
