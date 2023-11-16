import 'dart:convert';

class NotificationsModel {
  int? status;
  bool? error;
  List<NotificationItemModel>? notifications;

  NotificationsModel({this.status, this.error, this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      notifications = <NotificationItemModel>[];
      json['data'].forEach((v) {
        notifications!.add(NotificationItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    if (notifications != null) {
      data['data'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItemModel {
  int? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationItemModel({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NotificationItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null
        ? Data.fromJson(jsonDecode(json['data'].toString()))
        : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    data['data'] = data.toString();
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Data {
  String? id;
  int? forAdmin;
  Notification? notification;

  Data({this.id, this.forAdmin, this.notification});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    forAdmin = json['for_admin'];
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['for_admin'] = forAdmin;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    return data;
  }
}

class Notification {
  int? id;
  String? event;
  String? to;
  String? name;
  String? avatar;
  String? link;
  String? type;
  String? message;

  Notification(
      {this.id,
      this.event,
      this.to,
      this.name,
      this.avatar,
      this.link,
      this.type,
      this.message});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    event = json['event'];
    to = json['to'];
    name = json['name'];
    avatar = json['avatar'];
    link = json['link'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['event'] = event;
    data['to'] = to;
    data['name'] = name;
    data['avatar'] = avatar;
    data['link'] = link;
    data['type'] = type;
    data['message'] = message;
    return data;
  }
}
