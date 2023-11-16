import 'dart:convert';
import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/notifications_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class NotificationsProvider extends ChangeNotifier {
  static NotificationsProvider get(context) =>
      Provider.of<NotificationsProvider>(context);

  static NotificationsProvider listenFalse(context) =>
      Provider.of<NotificationsProvider>(context, listen: false);

  bool isNotificatonsNotRead = false;
  DataStatus? notificationStatus;
  DataStatus? notificationReadStatus;
  DataStatus? notificationReadAllStatus;
  DataStatus? notificationDeleteStatus;
  DataStatus? notificationDeleteAllStatus;
  NotificationsModel? notificationModel;

  // bool get isNotificatonsNotRead => _isNotificatonsNotRead;
  // DataStatus? get notificationStatus => _notificationStatus;
  // DataStatus? get notificationReadStatus => _notificationReadStatus;
  // DataStatus? get notificationReadAllStatus => _notificationReadAllStatus;
  // DataStatus? get notificationDeleteStatus => _notificationDeleteStatus;
  // DataStatus? get notificationDeleteAllStatus => _notificationDeleteAllStatus;
  // NotificationsModel get notificationModel => _notificationModel!;
  String? currentId;
  Future<void> getNotifications({bool retry = false}) async {
    try {
      if (retry) {
        notificationStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest('user/notifications', withAuth: true);
      if (r.toString().contains('error') && r['error'] == false) {
        notificationModel =
            NotificationsModel.fromJson(json.decode(jsonEncode(r)));
        isNotificatonsNotRead =
            notificationModel!.notifications!.any((n) => n.readAt == null);
        notificationStatus = DataStatus.successed;
      } else {
        notificationStatus = DataStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> makeNotificationRead(String id, {bool retry = false}) async {
    try {
      if (retry) {
        currentId = id;
        notificationReadStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest('user/markAsRead?id=$id', {},
          withAuth: true);

      if (r.toString().contains('error') && r['error'] == false) {
        await getNotifications().then((value) {
          currentId = null;
          notificationReadStatus = DataStatus.successed;
        });
      } else {
        notificationReadStatus = DataStatus.error;
        currentId = null;
      }
    } catch (e) {
      currentId = null;
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> makeNotificationReadAll({bool retry = false}) async {
    try {
      if (retry) {
        notificationReadAllStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest('user/markAllAsRead',
          withAuth: true, withLoading: true);
      print(r);

      if (r.toString().contains('error') && r['error'] == false) {
        await getNotifications(retry: true).then((value) {
          notificationReadAllStatus = DataStatus.successed;
        });
      } else {
        notificationReadAllStatus = DataStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> deleteOneNotification(String id, {bool retry = false}) async {
    try {
      if (retry) {
        currentId = id;
        notificationDeleteStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.postRequest(
          'user/deleteOneNotification?id=$id', {},
          withAuth: true);

      if (r.toString().contains('error') && r['error'] == false) {
        await getNotifications().then((value) {
          currentId = null;
          notificationDeleteStatus = DataStatus.successed;
        });
      } else {
        currentId = null;
        notificationDeleteStatus = DataStatus.error;
      }
    } catch (e) {
      currentId = null;
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> deleteAllNotification({bool retry = false}) async {
    try {
      if (retry) {
        notificationDeleteAllStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest('user/deleteNotification',
          withAuth: true, withLoading: true);
      log(r.toString());
      if ((r.toString().contains('error') && r['error'] == false) ||
          r['status'] == 200) {
        await getNotifications().then((value) {
          notificationDeleteAllStatus = DataStatus.successed;
        });
      } else {
        notificationDeleteAllStatus = DataStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
