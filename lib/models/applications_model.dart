class ApplicationsModel {
  bool? error;
  bool? messages;
  ApplicationModel? applicationModel;

  ApplicationsModel({error, messages, data});

  ApplicationsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    applicationModel = json['data'] != null ?  ApplicationModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (applicationModel != null) {
      data['data'] = applicationModel!.toJson();
    }
    return data;
  }
}

class ApplicationModel {
  List<Application>? applications;
  String? menuActive;
  String? pageTitle;

  ApplicationModel({rows, menuActive, pageTitle});

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      applications = <Application>[];
      json['rows'].forEach((v) {
        applications!.add( Application.fromJson(v));
      });
    }
    menuActive = json['menu_active'];
    pageTitle = json['page_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (applications != null) {
      data['rows'] = applications!.map((v) => v.toJson()).toList();
    }
    data['menu_active'] = menuActive;
    data['page_title'] = pageTitle;
    return data;
  }
}

class Application {
  int? id;
  int? jobId;
  int? candidateId;
  int? cvId;
  String? message;
  String? status;
  int? companyId;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;
  JobInfo? jobInfo;
  CandidateInfo? candidateInfo;
  CvInfo? cvInfo;
  Company? company;

  Application(
      {id,
      jobId,
      candidateId,
      cvId,
      message,
      status,
      companyId,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      jobInfo,
      candidateInfo,
      cvInfo,
      company});

  Application.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    candidateId = json['candidate_id'];
    cvId = json['cv_id'];
    message = json['message'];
    status = json['status'];
    companyId = json['company_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jobInfo = json['job_info'] != null
        ?  JobInfo.fromJson(json['job_info'])
        : null;
    candidateInfo = json['candidate_info'] != null
        ?  CandidateInfo.fromJson(json['candidate_info'])
        : null;
    cvInfo =
        json['cv_info'] != null ?  CvInfo.fromJson(json['cv_info']) : null;
    company =
        json['company'] != null ?  Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['job_id'] = jobId;
    data['candidate_id'] = candidateId;
    data['cv_id'] = cvId;
    data['message'] = message;
    data['status'] = status;
    data['company_id'] = companyId;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (jobInfo != null) {
      data['job_info'] = jobInfo!.toJson();
    }
    if (candidateInfo != null) {
      data['candidate_info'] = candidateInfo!.toJson();
    }
    if (cvInfo != null) {
      data['cv_info'] = cvInfo!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class JobInfo {
  int? id;
  String? title;
  String? slug;
  String? content;
  int? categoryId;
  int? thumbnailId;
  int? locationId;
  int? companyId;
  int? jobTypeId;
  String? expirationDate;
  String? hours;
  String? hoursType;
  String? salaryType;
  String? salaryMin;
  String? salaryMax;
  String? gender;
  String? mapLat;
  String? mapLng;
  int? mapZoom;
  int? experience;
  int? isFeatured;
  int? isUrgent;
  String? status;
  dynamic deletedAt;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  dynamic updatedAt;
  String? applyType;
  dynamic applyLink;
  dynamic applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  dynamic numberRecruitments;
  String? isApproved;
  dynamic wageAgreement;

  JobInfo(
      {id,
      title,
      slug,
      content,
      categoryId,
      thumbnailId,
      locationId,
      companyId,
      jobTypeId,
      expirationDate,
      hours,
      hoursType,
      salaryType,
      salaryMin,
      salaryMax,
      gender,
      mapLat,
      mapLng,
      mapZoom,
      experience,
      isFeatured,
      isUrgent,
      status,
      deletedAt,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      applyType,
      applyLink,
      applyEmail,
      gallery,
      video,
      videoCoverId,
      numberRecruitments,
      isApproved,
      wageAgreement});

  JobInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    categoryId = json['category_id'];
    thumbnailId = json['thumbnail_id'];
    locationId = json['location_id'];
    companyId = json['company_id'];
    jobTypeId = json['job_type_id'];
    expirationDate = json['expiration_date'];
    hours = json['hours'];
    hoursType = json['hours_type'];
    salaryType = json['salary_type'];
    salaryMin = json['salary_min'];
    salaryMax = json['salary_max'];
    gender = json['gender'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    mapZoom = json['map_zoom'];
    experience = json['experience'];
    isFeatured = json['is_featured'];
    isUrgent = json['is_urgent'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    applyType = json['apply_type'];
    applyLink = json['apply_link'];
    applyEmail = json['apply_email'];
    gallery = json['gallery'];
    video = json['video'];
    videoCoverId = json['video_cover_id'];
    numberRecruitments = json['number_recruitments'];
    isApproved = json['is_approved'];
    wageAgreement = json['wage_agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['content'] = content;
    data['category_id'] = categoryId;
    data['thumbnail_id'] = thumbnailId;
    data['location_id'] = locationId;
    data['company_id'] = companyId;
    data['job_type_id'] = jobTypeId;
    data['expiration_date'] = expirationDate;
    data['hours'] = hours;
    data['hours_type'] = hoursType;
    data['salary_type'] = salaryType;
    data['salary_min'] = salaryMin;
    data['salary_max'] = salaryMax;
    data['gender'] = gender;
    data['map_lat'] = mapLat;
    data['map_lng'] = mapLng;
    data['map_zoom'] = mapZoom;
    data['experience'] = experience;
    data['is_featured'] = isFeatured;
    data['is_urgent'] = isUrgent;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['apply_type'] = applyType;
    data['apply_link'] = applyLink;
    data['apply_email'] = applyEmail;
    data['gallery'] = gallery;
    data['video'] = video;
    data['video_cover_id'] = videoCoverId;
    data['number_recruitments'] = numberRecruitments;
    data['is_approved'] = isApproved;
    data['wage_agreement'] = wageAgreement;
    return data;
  }
}

class CandidateInfo {
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
  dynamic updateUser;
  String? slug;
  dynamic deletedAt;
  dynamic originId;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
  int? videoCoverId;

  CandidateInfo(
      {id,
      title,
      website,
      gender,
      gallery,
      video,
      allowSearch,
      education,
      experience,
      award,
      socialMedia,
      languages,
      educationLevel,
      experienceYear,
      expectedSalary,
      salaryType,
      locationId,
      mapLat,
      mapLng,
      mapZoom,
      city,
      country,
      address,
      createUser,
      updateUser,
      slug,
      deletedAt,
      originId,
      lang,
      createdAt,
      updatedAt,
      videoCoverId});

  CandidateInfo.fromJson(Map<String, dynamic> json) {
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
        education!.add( Education.fromJson(v));
      });
    }
    if (json['experience'] != null) {
      experience = <Experience>[];
      json['experience'].forEach((v) {
        experience!.add( Experience.fromJson(v));
      });
    }
    if (json['award'] != null) {
      award = <Award>[];
      json['award'].forEach((v) {
        award!.add( Award.fromJson(v));
      });
    }
    socialMedia = json['social_media'] != null
        ?  SocialMedia.fromJson(json['social_media'])
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
    return data;
  }
}
class Award {
  String? from;
  String? to;
  String? location;
  String? reward;
  String? information;

  Award({from, to, location, reward, information});

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
class Education {
  String? from;
  String? to;
  String? location;
  String? reward;
  String? information;

  Education({from, to, location, reward, information});

  Education.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    location = json['location'];
    reward = json['reward'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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

  Experience(
      {from, to, location, position, information});

  Experience.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    location = json['location'];
    position = json['position'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['location'] = location;
    data['position'] = position;
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

  SocialMedia(
      {skype,
      facebook,
      twitter,
      instagram,
      pinterest,
      dribbble,
      google,
      linkedin});

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
    final Map<String, dynamic> data =  <String, dynamic>{};
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

class CvInfo {
  int? id;
  int? fileId;
  int? originId;
  int? isDefault;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;
  Media? media;

  CvInfo(
      {id,
      fileId,
      originId,
      isDefault,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      media});

  CvInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    originId = json['origin_id'];
    isDefault = json['is_default'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    media = json['media'] != null ?  Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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

class Company {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? website;
  int? avatarId;
  int? coverId;
  String? foundedIn;
  int? allowSearch;
  int? isFeatured;
  int? ownerId;
  int? locationId;
  int? categoryId;
  int? teamSize;
  String? about;
  SocialMedia? socialMedia;
  String? city;
  dynamic state;
  String? country;
  dynamic zipCode;
  String? address;
  String? slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  String? mapLat;
  String? mapLng;
  dynamic deletedAt;
  String? createdAt;
  dynamic updatedAt;
  GetAuthor? getAuthor;

  Company(
      {id,
      name,
      email,
      phone,
      website,
      avatarId,
      coverId,
      foundedIn,
      allowSearch,
      isFeatured,
      ownerId,
      locationId,
      categoryId,
      teamSize,
      about,
      socialMedia,
      city,
      state,
      country,
      zipCode,
      address,
      slug,
      status,
      createUser,
      updateUser,
      mapLat,
      mapLng,
      deletedAt,
      createdAt,
      updatedAt,
      getAuthor});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    avatarId = json['avatar_id'];
    coverId = json['cover_id'];
    foundedIn = json['founded_in'];
    allowSearch = json['allow_search'];
    isFeatured = json['is_featured'];
    ownerId = json['owner_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    teamSize = json['team_size'];
    about = json['about'];
    socialMedia = json['social_media'] != null
        ?  SocialMedia.fromJson(json['social_media'])
        : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zip_code'];
    address = json['address'];
    slug = json['slug'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    mapLat = json['map_lat'];
    mapLng = json['map_lng'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getAuthor = json['get_author'] != null
        ?  GetAuthor.fromJson(json['get_author'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    data['avatar_id'] = avatarId;
    data['cover_id'] = coverId;
    data['founded_in'] = foundedIn;
    data['allow_search'] = allowSearch;
    data['is_featured'] = isFeatured;
    data['owner_id'] = ownerId;
    data['location_id'] = locationId;
    data['category_id'] = categoryId;
    data['team_size'] = teamSize;
    data['about'] = about;
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.toJson();
    }
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zip_code'] = zipCode;
    data['address'] = address;
    data['slug'] = slug;
    data['status'] = status;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['map_lat'] = mapLat;
    data['map_lng'] = mapLng;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (getAuthor != null) {
      data['get_author'] = getAuthor!.toJson();
    }
    return data;
  }
}

class GetAuthor {
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
  String? billingLastName;
  String? billingFirstName;
  String? country;
  String? state;
  String? city;
  String? zipCode;
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

  GetAuthor(
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

  GetAuthor.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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
