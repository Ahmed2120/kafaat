class CategoryJobsModel {
  bool? error;
  bool? messages;
  CategoryJobs? categoryJobs;

  CategoryJobsModel({error, messages, categoryJobs});

  CategoryJobsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    categoryJobs = json['data'] != null ?  CategoryJobs.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (categoryJobs != null) {
      data['data'] = categoryJobs!.toJson();
    }
    return data;
  }
}

class CategoryJobs {
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
  List<OpenJobs>? openJobs;

  CategoryJobs(
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
      openJobs});

  CategoryJobs.fromJson(Map<String, dynamic> json) {
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
    if (json['open_jobs'] != null) {
      openJobs = <OpenJobs>[];
      json['open_jobs'].forEach((v) {
        openJobs!.add( OpenJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
    if (openJobs != null) {
      data['open_jobs'] = openJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OpenJobs {
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
  String? applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  dynamic numberRecruitments;
  String? isApproved;
  dynamic wageAgreement;

  OpenJobs(
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

  OpenJobs.fromJson(Map<String, dynamic> json) {
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
