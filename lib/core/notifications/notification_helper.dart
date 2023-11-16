// import 'dart:convert';
// import 'dart:developer';
// import 'dart:math' as math;

// import 'package:flutter/foundation.dart' show kDebugMode;
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:kafaat/core/services/local_data.dart';
// import 'package:pusher_beams/pusher_beams.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class NotificationHelper {
//   NotificationHelper() {
//     if (LocalData.userProfileData.id != null) {
//       // initPusher();
//       initBeam();
//       if (LocalData.userProfileData.id != null) {
//         // initUserBeam();
//       }
//     }
//   }

//   // String appId = "1700476";
//   // String key = "331ce6d11688a18faf6c";
//   // String secret = "6cca7d5dbf8145f12b76";
//   // String cluster = "eu";

//   String appId = "1701011";
//   String key = "733a8d25b972edfcf6af";
//   String secret = "6da9dec05fab5dd649f9";
//   String cluster = "eu";
//   String instanceID = '11503466-edf7-42cc-a48c-0e68fad187df';

//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//   static final _localNotify = FlutterLocalNotificationsPlugin();
//   initBeam() async {
//     await PusherBeams.instance.start(instanceID);
//     await PusherBeams.instance.setDeviceInterests(['debug-good']);
//     await PusherBeams.instance.onInterestChanges((interests) {
//       log(interests.toString());
//     });
//     await PusherBeams.instance.onMessageReceivedInTheForeground((notification) {
//       log(notification.toString());
//       showNotification({
//         'title': notification['title'].toString(),
//         'message': notification.toString(),
//       });
//     });
//   }

//   initUserBeam() async {
//     final BeamsAuthProvider beamsAuthProvider = BeamsAuthProvider()
//       ..authUrl = 'https://some-auth-url.com/secure'
//       ..headers = {'Content-Type': 'application/json'}
//       ..queryParams = {'page': '1'}
//       ..credentials = 'omit';
//     await PusherBeams.instance.start(instanceID);
//     await PusherBeams.instance.setUserId(
//         'User-id-${LocalData.userProfileData.id}',
//         beamsAuthProvider,
//         (error) => {
//               if (error != null) {log(error)}
//             });
//     await PusherBeams.instance.onMessageReceivedInTheForeground((notification) {
//       log(notification.toString());
//       showNotification({
//         'title': notification['title'].toString(),
//         'message': notification.toString(),
//       });
//     });
//   }

//   initPusher() async {
//     String channelName = "user-channel-${LocalData.userProfileData.id}";
//     try {
//       print("---------------");
//       print(pusher.channels);
//       log(pusher.channels.toString());
//       await pusher.init(
//         apiKey: key,
//         cluster: cluster,
//         onConnectionStateChange: (currentState, previousState) {
//           print("$currentState, $previousState");
//           log("$currentState, $previousState");
//         },
//         onMemberRemoved: (channelName, member) {
//           print("onMemberRemoved: $channelName member: $member");
//           log("onMemberRemoved: $channelName member: $member");
//         },
//         onMemberAdded: (channelName, member) {
//           print("onMemberRemoved: $channelName member: $member");
//           log("onMemberRemoved: $channelName member: $member");
//         },
//       );
//       // disconnect
//       await pusher.unsubscribe(channelName: channelName);
//       await pusher.disconnect();
//       // connect
//       await pusher.subscribe(
//         channelName: channelName,
//         onEvent: (e) => onEvent(e),
//       );
//       await pusher.connect();
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   onEvent(PusherEvent event) {
//     log("onEvent: $event");
//     print("onEvent: $event");
//     print("onEvent: $event");
//     showNotification({
//       'title': event.data.toString(),
//       'message': event.data.toString(),
//     });
//   }

//   void showNotification(Map<String, String> message) async {
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'CRChannelID',
//       'CRChannelName',
//       channelDescription: 'CRChanelDescription',
//       importance: Importance.max,
//       priority: Priority.high,
//       icon: '@mipmap/ic_launcher',
//       ticker: 'ticker',
//     );
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _localNotify.show(
//       math.Random().nextInt(999),
//       message['title'],
//       message['message'],
//       platformChannelSpecifics,
//       payload: json.encode(message),
//     );
//   }
// }
