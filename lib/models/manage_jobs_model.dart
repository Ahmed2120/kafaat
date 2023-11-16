class ManageJobsModel {
  bool? error;
  bool? messages;
  ManageJobModel? manageJobModel;

  ManageJobsModel({error, messages, data});

  ManageJobsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    manageJobModel =
        json['data'] != null ? ManageJobModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (manageJobModel != null) {
      data['data'] = manageJobModel!.toJson();
    }
    return data;
  }
}

class ManageJobModel {
  List<Job>? jobs;
  String? menuActive;
  List<Languages>? languages;
  String? locale;
  String? pageTitle;

  ManageJobModel({jobs, menuActive, languages, locale, pageTitle});

  ManageJobModel.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      jobs = <Job>[];
      json['rows'].forEach((v) {
        jobs!.add(Job.fromJson(v));
      });
    }
    menuActive = json['menu_active'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    locale = json['locale'];
    pageTitle = json['page_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobs != null) {
      data['rows'] = jobs!.map((v) => v.toJson()).toList();
    }
    data['menu_active'] = menuActive;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    data['locale'] = locale;
    data['page_title'] = pageTitle;
    return data;
  }
}

class Job {
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
  int? updateUser;
  String? createdAt;
  String? updatedAt;
  String? applyType;
  dynamic applyLink;
  String? applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  dynamic numberRecruitments;
  String? isApproved;
  int? wageAgreement;
  Location? location;
  Category? category;
  Company? company;

  Job(
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
      wageAgreement,
      location,
      category,
      company});

  Job.fromJson(Map<String, dynamic> json) {
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
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Location {
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

  Location(
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
      zipcode});

  Location.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Category {
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

  Category(
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
      updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
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
  dynamic foundedIn;
  dynamic allowSearch;
  dynamic isFeatured;
  int? ownerId;
  int? locationId;
  int? categoryId;
  int? teamSize;
  String? about;
  SocialMedia? socialMedia;
  String? city;
  dynamic state;
  dynamic country;
  String? zipCode;
  String? address;
  String? slug;
  String? status;
  int? createUser;
  int? updateUser;
  String? mapLat;
  String? mapLng;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

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
      updatedAt});

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
        ? SocialMedia.fromJson(json['social_media'])
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return data;
  }
}

class SocialMedia {
  dynamic skype;
  dynamic facebook;
  dynamic twitter;
  dynamic instagram;
  dynamic linkedin;
  dynamic google;

  SocialMedia({skype, facebook, twitter, instagram, linkedin, google});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    skype = json['skype'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    google = json['google'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skype'] = skype;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['linkedin'] = linkedin;
    data['google'] = google;
    return data;
  }
}

class Languages {
  int? id;
  String? locale;
  String? name;
  String? flag;
  String? status;
  int? createUser;
  int? updateUser;
  String? lastBuildAt;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Languages(
      {id,
      locale,
      name,
      flag,
      status,
      createUser,
      updateUser,
      lastBuildAt,
      deletedAt,
      createdAt,
      updatedAt});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    flag = json['flag'];
    status = json['status'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    lastBuildAt = json['last_build_at'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['name'] = name;
    data['flag'] = flag;
    data['status'] = status;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['last_build_at'] = lastBuildAt;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
