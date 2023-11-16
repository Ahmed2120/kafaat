// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// export 'package:provider/provider.dart';

// class FCMProvider extends ChangeNotifier {
//   static FCMProvider get(context) => Provider.of<FCMProvider>(context);

//   static FCMProvider listenFalse(context) =>
//       Provider.of<FCMProvider>(context, listen: false);

//   String? token;

//   Future<String?> get getToken async {
//     token = await FirebaseMessaging.instance.getToken();
//     log(token!);
//     return token;
//   }

//   Future<void> sendNotification(
//       String tokenTo, String type, String message, title) async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization':
//           'key=AAAAT9dSCko:APA91bF05N0eoNSDQoIoo6UT5kWbcDxf2evjh6WJV5rqlK0OxUqZKASQLl9injE33wlktr0Hh0tDo6RmOkqVs88llW_8oc7XHExlLYz4xX4m-p0jtMYYq3cYgQ2oQQMIGxSIU3caDs72'
//     };
//     var request =
//         http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
//     request.body = json.encode({
//       "to": tokenTo,
//       "data": {"type": 'job-$type'},
//       "notification": {
//         "title": title,
//         "body": message,
//       }
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }
