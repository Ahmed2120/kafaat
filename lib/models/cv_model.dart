class CVModel {
  CVItems? cv;
  String? message;
  bool? error;

  CVModel({cv, status, message, error});

  CVModel.fromJson(Map<String, dynamic> json) {
    cv = json['data'] != null ? CVItems.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cv != null) {
      data['data'] = cv!.toJson();
    }
    data['message'] = message;
    data['error'] = error;
    return data;
  }
}

class CVItems {
  List<Cv>? cvs;

  CVItems({cvs});

  CVItems.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      cvs = <Cv>[];
      json['rows'].forEach((v) {
        cvs!.add(Cv.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cvs != null) {
      data['rows'] = cvs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cv {
  int? id;
  int? fileId;
  int? originId;
  int? isDefault;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;
  Media? media;

  Cv(
      {id,
      fileId,
      originId,
      isDefault,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      media});

  Cv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    originId = json['origin_id'];
    isDefault = json['is_default'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_id'] = fileId;
    data['origin_id'] = originId;
    data['is_default'] = isDefault;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Media {
  int? id;
  String? fileName;
  String? filePath;
  dynamic fileSize;
  String? fileType;
  String? fileExtension;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  dynamic appId;
  dynamic appUserId;
  dynamic fileWidth;
  dynamic fileHeight;
  dynamic createdAt;
  dynamic updatedAt;

  Media(
      {id,
      fileName,
      filePath,
      fileSize,
      fileType,
      fileExtension,
      createUser,
      updateUser,
      deletedAt,
      appId,
      appUserId,
      fileWidth,
      fileHeight,
      createdAt,
      updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    fileSize = json['file_size'];
    fileType = json['file_type'];
    fileExtension = json['file_extension'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    appId = json['app_id'];
    appUserId = json['app_user_id'];
    fileWidth = json['file_width'];
    fileHeight = json['file_height'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    data['file_size'] = fileSize;
    data['file_type'] = fileType;
    data['file_extension'] = fileExtension;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['app_id'] = appId;
    data['app_user_id'] = appUserId;
    data['file_width'] = fileWidth;
    data['file_height'] = fileHeight;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
