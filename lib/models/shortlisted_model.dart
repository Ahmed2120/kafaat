class ShortlistedModel {
  bool? error;
  bool? messages;
  ShortlistModel? shortlistModel;

  ShortlistedModel({error, messages, shortlistModel});

  ShortlistedModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    shortlistModel =
        json['data'] != null ? ShortlistModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (shortlistModel != null) {
      data['data'] = shortlistModel!.toJson();
    }
    return data;
  }
}

class ShortlistModel {
  List<Shortlisted>? shortlists;

  ShortlistModel({shortlists});

  ShortlistModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      shortlists = <Shortlisted>[];
      json['rows'].forEach((v) {
        shortlists!.add(Shortlisted.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shortlists != null) {
      data['rows'] = shortlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shortlisted {
  int? id;
  int? objectId;
  String? objectModel;
  int? userId;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;
  Candidat? candidat;

  Shortlisted(
      {id,
      objectId,
      objectModel,
      userId,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      candidat});

  Shortlisted.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
    userId = json['user_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    candidat =
        json['candidat'] != null ? Candidat.fromJson(json['candidat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object_id'] = objectId;
    data['object_model'] = objectModel;
    data['user_id'] = userId;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (candidat != null) {
      data['candidat'] = candidat!.toJson();
    }
    return data;
  }
}

class Candidat {
  int? id;
  String? title;
  String? slug;
  String? createdAt;
  User? user;
  List<Cvs>? cvs;

  Candidat({id, title, slug, createdAt, user, cvs});

  Candidat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['cvs'] != null) {
      cvs = <Cvs>[];
      json['cvs'].forEach((v) {
        cvs!.add(Cvs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (cvs != null) {
      data['cvs'] = cvs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  dynamic birthday;
  dynamic lastLoginAt;
  int? avatarId;
  String? bio;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic vendorCommissionAmount;
  dynamic vendorCommissionType;
  int? roleId;
  dynamic billingLastName;
  dynamic billingFirstName;
  String? country;
  dynamic state;
  dynamic city;
  dynamic zipCode;
  String? address;
  dynamic address2;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  dynamic paymentGateway;
  dynamic totalGuests;
  dynamic locale;
  dynamic verifySubmitStatus;
  dynamic isVerified;
  int? needUpdatePw;

  User(
      {id,
      name,
      firstName,
      lastName,
      email,
      emailVerifiedAt,
      phone,
      birthday,
      lastLoginAt,
      avatarId,
      bio,
      status,
      createUser,
      updateUser,
      vendorCommissionAmount,
      vendorCommissionType,
      roleId,
      billingLastName,
      billingFirstName,
      country,
      state,
      city,
      zipCode,
      address,
      address2,
      deletedAt,
      createdAt,
      updatedAt,
      paymentGateway,
      totalGuests,
      locale,
      verifySubmitStatus,
      isVerified,
      needUpdatePw});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    birthday = json['birthday'];
    lastLoginAt = json['last_login_at'];
    avatarId = json['avatar_id'];
    bio = json['bio'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    vendorCommissionAmount = json['vendor_commission_amount'];
    vendorCommissionType = json['vendor_commission_type'];
    roleId = json['role_id'];
    billingLastName = json['billing_last_name'];
    billingFirstName = json['billing_first_name'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    address = json['address'];
    address2 = json['address2'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentGateway = json['payment_gateway'];
    totalGuests = json['total_guests'];
    locale = json['locale'];
    verifySubmitStatus = json['verify_submit_status'];
    isVerified = json['is_verified'];
    needUpdatePw = json['need_update_pw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['last_login_at'] = lastLoginAt;
    data['avatar_id'] = avatarId;
    data['bio'] = bio;
    data['status'] = status;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['vendor_commission_amount'] = vendorCommissionAmount;
    data['vendor_commission_type'] = vendorCommissionType;
    data['role_id'] = roleId;
    data['billing_last_name'] = billingLastName;
    data['billing_first_name'] = billingFirstName;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['zip_code'] = zipCode;
    data['address'] = address;
    data['address2'] = address2;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['payment_gateway'] = paymentGateway;
    data['total_guests'] = totalGuests;
    data['locale'] = locale;
    data['verify_submit_status'] = verifySubmitStatus;
    data['is_verified'] = isVerified;
    data['need_update_pw'] = needUpdatePw;
    return data;
  }
}

class Cvs {
  int? id;
  int? fileId;
  int? originId;
  int? isDefault;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  dynamic updatedAt;
  Media? media;

  Cvs(
      {id,
      fileId,
      originId,
      isDefault,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      media});

  Cvs.fromJson(Map<String, dynamic> json) {
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
