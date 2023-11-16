// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:kafaat/firebase_options.dart';

// Future<void> _firebaseMessagingBackgroundHandler(message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FCMService().showNotificaion(
//       title: message.notification!.title, body: message.notification!.body);
//   print('Handling a background message ${message.messageId}');
// }

// class FCMService {
//   static final FCMService _notificationService = FCMService._internal();

//   factory FCMService() {
//     return _notificationService;
//   }

//   FCMService._internal();

// // Local
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   Future<void> initLocalNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');

//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       onDidReceiveLocalNotification: (id, title, body, payload) => {},
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsIOS,
//             macOS: null);

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {},
//     );
//   }

//   notificationDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//           'high_importance_channel', 'highImportanceChannel',
//           importance: Importance.max),
//       iOS: DarwinNotificationDetails(),
//     );
//   }

//   Future showNotificaion(
//       {int id = 0, String? title, String? body, String? payload}) async {
//     return flutterLocalNotificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }

// // FCM
//   Future<void> init() async {
//     await initLocalNotification();
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     await messaging.setAutoInitEnabled(true);
//     // Requesting permission (Apple & Web)
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');

//     // Background Notifications
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     // Foreground Notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (message.notification != null) {
//         showNotificaion(
//             title: message.notification!.title,
//             body: message.notification!.body);
//       }
//     });
//   }

//   Future<void> setupInteractedMessage() async {
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     if (initialMessage != null) {
//       _handleMessage(initialMessage);
//     }

//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       _handleMessage(message);
//     });
//   }

//   void _handleMessage(RemoteMessage message) {
//     final data = message.data['type'].toString().split('-');
//     if (data[0] == 'job') {}
//   }
// }
