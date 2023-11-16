// ignore_for_file: public_member_api_docs, sort_constructors_first
class CandidateProfileModel {
  bool? error;
  bool? messages;
  CandidateProfile? candidateProfile;

  CandidateProfileModel({error, messages, data});

  CandidateProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    candidateProfile =
        json['data'] != null ? CandidateProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (candidateProfile != null) {
      data['data'] = candidateProfile!.toJson();
    }
    return data;
  }
}

class CandidateProfile {
  Profile? profile;
  User? user;
  List<Skills>? userskills;
  List<Categories>? usercategories;
  Seo? seo;
  List<Locations>? locations;
  List<Categories>? categories;
  List<Skills>? skills;
  List<Cvs>? cvs;
  Map<String, String>? languages;

  CandidateProfile(
      {profile,
      user,
      userskills,
      usercategories,
      seo,
      locations,
      categories,
      skills,
      cvs,
      languages});

  CandidateProfile.fromJson(Map<String, dynamic> json) {
    profile = json['row'] != null ? Profile.fromJson(json['row']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['usercategories'] != null) {
      usercategories = <Categories>[];
      json['usercategories'].forEach((v) {
        usercategories!.add(Categories.fromJson(v));
      });
    }
    if (json['userskills'] != null) {
      userskills = <Skills>[];
      json['userskills'].forEach((v) {
        userskills!.add(Skills.fromJson(v));
      });
    }
    seo = json['seo'] != null ? Seo.fromJson(json['seo']) : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    if (json['cvs'] != null) {
      cvs = <Cvs>[];
      json['cvs'].forEach((v) {
        cvs!.add(Cvs.fromJson(v));
      });
    }
    languages = json['languages'].cast<String, String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['row'] = profile!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (usercategories != null) {
      data['usercategories'] = usercategories!.map((v) => v.toJson()).toList();
    }
    if (userskills != null) {
      data['userskills'] = userskills!.map((v) => v.toJson()).toList();
    }
    if (seo != null) {
      data['seo'] = seo!.toJson();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (cvs != null) {
      data['cvs'] = cvs!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages;
    }
    return data;
  }
}

class Profile {
  int? id;
  String? title;
  dynamic website;
  String? gender;
  String? gallery;
  String? video;
  String? allowSearch;
  List<Education>? education;
  List<Experience>? experience;
  List<Award>? award;
  SocialMedia? socialMedia;
  String? languages;
  String? educationLevel;
  int? experienceYear;
  int? expectedSalary;
  String? salaryType;
  int? locationId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? city;
  String? country;
  dynamic address;
  int? createUser;
  int? updateUser;
  String? slug;
  dynamic deletedAt;
  dynamic originId;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
  int? videoCoverId;
  List<Skills>? skills;
  List<Categories>? categories;
  Profile({
    this.id,
    this.title,
    required this.website,
    this.gender,
    this.gallery,
    this.video,
    this.allowSearch,
    this.education,
    this.experience,
    this.award,
    this.socialMedia,
    this.languages,
    this.educationLevel,
    this.experienceYear,
    this.expectedSalary,
    this.salaryType,
    this.locationId,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.city,
    this.country,
    required this.address,
    this.createUser,
    this.updateUser,
    this.slug,
    required this.deletedAt,
    required this.originId,
    required this.lang,
    this.createdAt,
    this.updatedAt,
    this.videoCoverId,
    this.skills,
    this.categories,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    website = json['website'];
    gender = json['gender'];
    gallery = json['gallery'];
    video = json['video'];
    allowSearch = json['allow_search'];
    if (json['education'] != null) {
      education = <Education>[];
      json['education'].forEach((v) {
        education!.add(Education.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add(Experience.fromJson(v));
      });
    }
    if (json['award'] != null) {
      award = <Award>[];
      json['award'].forEach((v) {
        award!.add(Award.fromJson(v));
      });
    }
    socialMedia = json['social_media'] != null
        ? SocialMedia.fromJson(json['social_media'])
        : null;
    languages = json['languages'];
    educationLevel = json['education_level'];
    experienceYear = json['experience_year'];
    expectedSalary = json['expected_salary'];
    salaryType = json['salary_type'];
    locationId = json['location_id'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    slug = json['slug'];
    deletedAt = json['deleted_at'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoCoverId = json['video_cover_id'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['website'] = website;
    data['gender'] = gender;
    data['gallery'] = gallery;
    data['video'] = video;
    data['allow_search'] = allowSearch;
    if (education != null) {
      data['education'] = education!.map((v) => v.toJson()).toList();
    }
    if (experience != null) {
      data['experience'] = experience!.map((v) => v.toJson()).toList();
    }
    if (award != null) {
      data['award'] = award!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.toJson();
    }
    data['languages'] = languages;
    data['education_level'] = educationLevel;
    data['experience_year'] = experienceYear;
    data['expected_salary'] = expectedSalary;
    data['salary_type'] = salaryType;
    data['location_id'] = locationId;
    data['map_lat'] = mapLat;
    data['map_lng'] = mapLng;
    data['map_zoom'] = mapZoom;
    data['city'] = city;
    data['country'] = country;
    data['address'] = address;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['slug'] = slug;
    data['deleted_at'] = deletedAt;
    data['origin_id'] = originId;
    data['lang'] = lang;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['video_cover_id'] = videoCoverId;
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
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
  String? emailVerifiedAt;
  String? phone;
  dynamic birthday;
  dynamic lastLoginAt;
  dynamic avatarId;
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
  Role? role;
  Profile? candidate;

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
      needUpdatePw,
      role,
      candidate});

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
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    candidate =
        json['candidate'] != null ? Profile.fromJson(json['candidate']) : null;
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
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? code;
  dynamic createUser;
  dynamic updateUser;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Role({id, name, code, createUser, updateUser, status, createdAt, updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Seo {
  int? id;
  int? objectId;
  String? objectModel;
  dynamic seoIndex;
  String? seoTitle;
  dynamic seoDesc;
  dynamic seoImage;
  dynamic seoShare;
  int? createUser;
  int? updateUser;
  dynamic originId;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? fullUrl;
  String? serviceTitle;
  dynamic serviceDesc;
  dynamic serviceImage;

  Seo(
      {id,
      objectId,
      objectModel,
      seoIndex,
      seoTitle,
      seoDesc,
      seoImage,
      seoShare,
      createUser,
      updateUser,
      originId,
      lang,
      createdAt,
      updatedAt,
      slug,
      fullUrl,
      serviceTitle,
      serviceDesc,
      serviceImage});

  Seo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
    seoIndex = json['seo_index'];
    seoTitle = json['seo_title'];
    seoDesc = json['seo_desc'];
    seoImage = json['seo_image'];
    seoShare = json['seo_share'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    fullUrl = json['full_url'];
    serviceTitle = json['service_title'];
    serviceDesc = json['service_desc'];
    serviceImage = json['service_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object_id'] = objectId;
    data['object_model'] = objectModel;
    data['seo_index'] = seoIndex;
    data['seo_title'] = seoTitle;
    data['seo_desc'] = seoDesc;
    data['seo_image'] = seoImage;
    data['seo_share'] = seoShare;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['origin_id'] = originId;
    data['lang'] = lang;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    data['full_url'] = fullUrl;
    data['service_title'] = serviceTitle;
    data['service_desc'] = serviceDesc;
    data['service_image'] = serviceImage;
    return data;
  }
}

class Locations {
  int? id;
  String? name;
  String? slug;
  int? imageId;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  String? status;
  int? iLft;
  int? iRgt;
  dynamic parentId;
  int? createUser;
  dynamic updateUser;
  dynamic deletedAt;
  dynamic originId;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
  dynamic zipcode;
  List<dynamic>? children;

  Locations(
      {id,
      name,
      slug,
      imageId,
      mapLat,
      mapLng,
      mapZoom,
      status,
      iLft,
      iRgt,
      parentId,
      createUser,
      updateUser,
      deletedAt,
      originId,
      lang,
      createdAt,
      updatedAt,
      zipcode,
      children});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    imageId = json['image_id'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    status = json['status'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zipcode = json['zipcode'];
    if (json['children'] != null) {
      children = <dynamic>[];
      json['children'].forEach((v) {
        children!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image_id'] = imageId;
    data['map_lat'] = mapLat;
    data['map_lng'] = mapLng;
    data['map_zoom'] = mapZoom;
    data['status'] = status;
    data['_lft'] = iLft;
    data['_rgt'] = iRgt;
    data['parent_id'] = parentId;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['origin_id'] = originId;
    data['lang'] = lang;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['zipcode'] = zipcode;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  dynamic content;
  String? slug;
  String? status;
  dynamic originId;
  String? icon;
  dynamic lang;
  int? iLft;
  int? iRgt;
  dynamic parentId;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? children;

  Categories(
      {id,
      name,
      content,
      slug,
      status,
      originId,
      icon,
      lang,
      iLft,
      iRgt,
      parentId,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt,
      children});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    slug = json['slug'];
    status = json['status'];
    originId = json['origin_id'];
    icon = json['icon'];
    lang = json['lang'];
    iLft = json['_lft'];
    iRgt = json['_rgt'];
    parentId = json['parent_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['children'] != null) {
      children = <dynamic>[];
      json['children'].forEach((v) {
        children!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['slug'] = slug;
    data['status'] = status;
    data['origin_id'] = originId;
    data['icon'] = icon;
    data['lang'] = lang;
    data['_lft'] = iLft;
    data['_rgt'] = iRgt;
    data['parent_id'] = parentId;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skills {
  int? id;
  String? name;
  String? slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Skills(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['status'] = status;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Cvs {
  int? id;
  int? fileId;
  int? originId;
  int? isDefault;
  int? createUser;
  int? updateUser;
  String? createdAt;
  String? updatedAt;
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
  String? fileSize;
  String? fileType;
  String? fileExtension;
  int? createUser;
  dynamic updateUser;
  dynamic deletedAt;
  dynamic appId;
  dynamic appUserId;
  dynamic fileWidth;
  dynamic fileHeight;
  String? createdAt;
  String? updatedAt;

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

class Education {
  String? from;
  String? to;
  String? location;
  String? reward;
  String? information;

  Education({
    this.from,
    this.to,
    this.location,
    this.reward,
    this.information,
  });

  Education.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    location = json['location'];
    reward = json['reward'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['location'] = location;
    data['reward'] = reward;
    data['information'] = information;
    return data;
  }
}

class Experience {
  String? from;
  String? to;
  String? location;
  String? position;
  String? information;
  Experience({
    this.from,
    this.to,
    this.location,
    this.position,
    this.information,
  });

  Experience.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    location = json['location'];
    position = json['position'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['location'] = location;
    data['position'] = position;
    data['information'] = information;
    return data;
  }
}

class Award {
  String? from;
  String? to;
  String? location;
  String? reward;
  String? information;
  Award({
    this.from,
    this.to,
    this.location,
    this.reward,
    this.information,
  });

  Award.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    location = json['location'];
    reward = json['reward'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['location'] = location;
    data['reward'] = reward;
    data['information'] = information;
    return data;
  }
}

class SocialMedia {
  String? skype;
  String? facebook;
  String? twitter;
  String? instagram;
  String? pinterest;
  String? dribbble;
  String? google;
  String? linkedin;
  SocialMedia({
    this.skype,
    this.facebook,
    this.twitter,
    this.instagram,
    this.pinterest,
    this.dribbble,
    this.google,
    this.linkedin,
  });

  SocialMedia.fromJson(Map<String, dynamic> json) {
    skype = json['skype'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    pinterest = json['pinterest'];
    dribbble = json['dribbble'];
    google = json['google'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skype'] = skype;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['pinterest'] = pinterest;
    data['dribbble'] = dribbble;
    data['google'] = google;
    data['linkedin'] = linkedin;
    return data;
  }
}

class SeoShare {
  FTMedia? facebook;
  FTMedia? twitter;

  SeoShare({facebook, twitter});

  SeoShare.fromJson(Map<String, dynamic> json) {
    facebook =
        json['facebook'] != null ? FTMedia.fromJson(json['facebook']) : null;
    twitter =
        json['twitter'] != null ? FTMedia.fromJson(json['twitter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (facebook != null) {
      data['facebook'] = facebook!.toJson();
    }
    if (twitter != null) {
      data['twitter'] = twitter!.toJson();
    }
    return data;
  }
}

class FTMedia {
  dynamic title;
  dynamic desc;
  dynamic image;

  FTMedia({title, desc, image});

  FTMedia.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['image'] = image;
    return data;
  }
}
