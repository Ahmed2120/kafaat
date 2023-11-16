import 'package:flutter/material.dart';

class AppRoutes {
  static Future<T?> routeTo<T extends Object?>(
      BuildContext context, Widget page,
      {int delayMS = 0}) async {
    T? t;
    await Future.delayed(Duration(milliseconds: delayMS), () async {
      t = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => page));
    });
    return t;
  }

  static Future<T?> routeRemoveTo<T extends Object?>(
      BuildContext context, Widget page,
      {int delayMS = 0}) async {
    T? t;
    await Future.delayed(Duration(milliseconds: delayMS), () async {
      t = await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
    return t;
  }

  static Future<T?> routeRemoveAllTo<T extends Object?>(
      BuildContext context, Widget page,
      {int delayMS = 0}) async {
    T? t;
    await Future.delayed(Duration(milliseconds: delayMS), () async {
      t = await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );
    });
    return t;
  }

  static Future pop<T extends Object?>(BuildContext context,
      {int delayMS = 0, T? result}) async {
    await Future.delayed(Duration(milliseconds: delayMS), () async {
      Navigator.pop(context, result);
    });
  }
}
