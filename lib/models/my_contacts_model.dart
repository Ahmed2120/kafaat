class MyContactsModel {
  bool? error;
  bool? messages;
  ContactModel? contactModel;

  MyContactsModel({error, messages, data});

  MyContactsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    contactModel =
        json['data'] != null ? ContactModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (contactModel != null) {
      data['data'] = contactModel!.toJson();
    }
    return data;
  }
}

class ContactModel {
  List<Contact>? contacts;
  String? menuActive;

  ContactModel({rows, menuActive});

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      contacts = <Contact>[];
      json['rows'].forEach((v) {
        contacts!.add(Contact.fromJson(v));
      });
    }
    menuActive = json['menu_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contacts != null) {
      data['rows'] = contacts!.map((v) => v.toJson()).toList();
    }
    data['menu_active'] = menuActive;
    return data;
  }
}

class Contact {
  int? id;
  int? originId;
  String? name;
  String? email;
  String? message;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? contactTo;
  int? objectId;
  dynamic objectModel;

  Contact(
      {id,
      originId,
      name,
      email,
      message,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt,
      contactTo,
      objectId,
      objectModel});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originId = json['origin_id'];
    name = json['name'];
    email = json['email'];
    message = json['message'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contactTo = json['contact_to'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['origin_id'] = originId;
    data['name'] = name;
    data['email'] = email;
    data['message'] = message;
    data['status'] = status;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['contact_to'] = contactTo;
    data['object_id'] = objectId;
    data['object_model'] = objectModel;
    return data;
  }
}
