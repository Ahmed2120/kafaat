import 'dart:convert';

import 'package:kafaat/models/user_login_model.dart';
import 'package:kafaat/models/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final LocalData _instance = LocalData._internal();

  factory LocalData() => _instance;

  LocalData._internal() {
    init();
  }

  init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static late SharedPreferences sharedPref;

  //! Setter Functions
  static Future<bool> setString(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sharedPref.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await sharedPref.remove(key);
  }

  //! Getter Functions
  static bool get isFirstOpenApp =>
      sharedPref.getBool(LocalKeys.isFirstOpenApp) ?? true;

  static bool get isRememberMe =>
      sharedPref.getBool(LocalKeys.isRememberMe) ?? false;

  static bool get isPrivacyAgree =>
      sharedPref.getBool(LocalKeys.isPrivacyAgree) ?? false;

  static UserLoginModel get userLoginData {
    UserLoginModel userLoginData = UserLoginModel.fromMap(jsonDecode(
        sharedPref.getString(LocalKeys.userLoginData) ??
            '{"token": null,"role": null}'));
    return userLoginData;
  }

  static UserProfileModel get userProfileData {
    UserProfileModel userProfileData = UserProfileModel.fromJson(jsonDecode(
        sharedPref.getString(LocalKeys.userProfileData) ??
            '{"id": null,"name": "","email":""}'));
    return userProfileData;
  }
}

class LocalKeys {
  static const String isFirstOpenApp = 'IS_FIRST_OPEN';
  static const String isRememberMe = 'IS_REMEMBER_ME';
  static const String isPrivacyAgree = 'IS_PRIVACY_AGREE';
  static const String userLoginData = 'USER_LOGIN_DATA';
  static const String userProfileData = 'USER_PROFILE_DATA';
}
