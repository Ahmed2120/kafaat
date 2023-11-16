class JobDetailsModel {
  bool? error;
  bool? messages;
  JobDetails? jobDetails;

  JobDetailsModel({error, messages, data});

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    jobDetails =
        json['data'] != null ? JobDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (jobDetails != null) {
      data['data'] = jobDetails!.toJson();
    }
    return data;
  }
}

class JobDetails {
  JobDetail? jobDetail;
  Translation? translation;
  List<JobRelated>? jobRelated;
  bool? candidate;
  bool? applied;
  bool? disableHeaderShadow;
  SeoMeta? seoMeta;

  JobDetails(
      {jobDetail,
      translation,
      jobRelated,
      candidate,
      applied,
      disableHeaderShadow,
      seoMeta});

  JobDetails.fromJson(Map<String, dynamic> json) {
    jobDetail = json['row'] != null ? JobDetail.fromJson(json['row']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    if (json['job_related'] != null) {
      jobRelated = <JobRelated>[];
      json['job_related'].forEach((v) {
        jobRelated!.add(JobRelated.fromJson(v));
      });
    }
    candidate = json['candidate'];
    applied = json['applied'];
    disableHeaderShadow = json['disable_header_shadow'];
    seoMeta =
        json['seo_meta'] != null ? SeoMeta.fromJson(json['seo_meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobDetail != null) {
      data['row'] = jobDetail!.toJson();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    if (jobRelated != null) {
      data['job_related'] = jobRelated!.map((v) => v.toJson()).toList();
    }
    data['candidate'] = candidate;
    data['applied'] = applied;
    data['disable_header_shadow'] = disableHeaderShadow;
    if (seoMeta != null) {
      data['seo_meta'] = seoMeta!.toJson();
    }
    return data;
  }
}

class JobDetail {
  int? id;
  String? title;
  String? slug;
  String? content;
  int? categoryId;
  dynamic thumbnailId;
  int? locationId;
  int? companyId;
  int? jobTypeId;
  String? expirationDate;
  String? hours;
  String? hoursType;
  dynamic salaryType;
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
  dynamic applyType;
  dynamic applyLink;
  dynamic applyEmail;
  dynamic gallery;
  dynamic video;
  int? videoCoverId;
  int? numberRecruitments;
  String? isApproved;
  int? wageAgreement;
  Location? location;
  List<dynamic>? translations;
  Category? category;
  Company? company;
  JobType? jobType;
  List<Skills>? skills;
  dynamic wishlist;

  JobDetail(
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
      translations,
      category,
      company,
      jobType,
      skills,
      wishlist});

  JobDetail.fromJson(Map<String, dynamic> json) {
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
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(v);
      });
    }
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    jobType =
        json['job_type'] != null ? JobType.fromJson(json['job_type']) : null;
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
    wishlist = json['wishlist'];
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
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (jobType != null) {
      data['job_type'] = jobType!.toJson();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    data['wishlist'] = wishlist;
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
  dynamic avatarId;
  int? coverId;
  dynamic foundedIn;
  dynamic allowSearch;
  dynamic isFeatured;
  int? ownerId;
  int? locationId;
  int? categoryId;
  TeamSize? teamSize;
  String? about;
  dynamic socialMedia;
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
    // teamSize = json['team_size'] != null
    //     ?  TeamSize.fromJson(json['team_size'])
    //     : null;
    about = json['about'];
    socialMedia = json['social_media'];
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
    // if (teamSize != null) {
    //   data['team_size'] = teamSize!.toJson();
    // }
    data['about'] = about;
    data['social_media'] = socialMedia;
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

class TeamSize {
  int? id;
  String? name;
  dynamic content;
  int? attrId;
  String? slug;
  dynamic createUser;
  dynamic updateUser;
  dynamic originId;
  dynamic lang;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic icon;
  dynamic deletedAt;
  dynamic imageId;
  List<dynamic>? translations;

  TeamSize(
      {id,
      name,
      content,
      attrId,
      slug,
      createUser,
      updateUser,
      originId,
      lang,
      createdAt,
      updatedAt,
      icon,
      deletedAt,
      imageId,
      translations});

  TeamSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    attrId = json['attr_id'];
    slug = json['slug'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    originId = json['origin_id'];
    lang = json['lang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
    deletedAt = json['deleted_at'];
    imageId = json['image_id'];
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['attr_id'] = attrId;
    data['slug'] = slug;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['origin_id'] = originId;
    data['lang'] = lang;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    data['deleted_at'] = deletedAt;
    data['image_id'] = imageId;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobType {
  int? id;
  String? name;
  dynamic slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  dynamic updatedAt;

  JobType(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  JobType.fromJson(Map<String, dynamic> json) {
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
  Pivot? pivot;

  Skills(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt,
      pivot});

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
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? jobId;
  int? skillId;

  Pivot({jobId, skillId});

  Pivot.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    skillId = json['skill_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['skill_id'] = skillId;
    return data;
  }
}

class Translation {
  String? locale;
  int? originId;
  String? title;
  String? content;

  Translation({locale, originId, title, content});

  Translation.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    originId = json['origin_id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    data['origin_id'] = originId;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}

class JobRelated {
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
  String? applyLink;
  dynamic applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  dynamic numberRecruitments;
  String? isApproved;
  dynamic wageAgreement;
  Location? location;
  List<dynamic>? translations;
  Company? company;
  Category? category;
  JobType? jobType;

  JobRelated(
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
      translations,
      company,
      category,
      jobType});

  JobRelated.fromJson(Map<String, dynamic> json) {
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
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(v);
      });
    }
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    jobType =
        json['job_type'] != null ? JobType.fromJson(json['job_type']) : null;
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
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (jobType != null) {
      data['job_type'] = jobType!.toJson();
    }
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

  SocialMedia(
      {skype, facebook, twitter, instagram, pinterest, dribbble, google});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    skype = json['skype'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    pinterest = json['pinterest'];
    dribbble = json['dribbble'];
    google = json['google'];
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
    return data;
  }
}

class SeoMeta {
  int? id;
  int? objectId;
  String? objectModel;
  dynamic seoIndex;
  dynamic seoTitle;
  dynamic seoDesc;
  dynamic seoImage;
  dynamic seoShare;
  int? createUser;
  dynamic updateUser;
  dynamic originId;
  dynamic lang;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? fullUrl;
  String? serviceTitle;
  dynamic serviceDesc;
  dynamic serviceImage;

  SeoMeta(
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

  SeoMeta.fromJson(Map<String, dynamic> json) {
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
