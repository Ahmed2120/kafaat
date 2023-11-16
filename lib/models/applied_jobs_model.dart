class AppliedJobsModel {
  bool? error;
  bool? messages;
  AppliedJobs? appliedJobs;

  AppliedJobsModel({error, messages, data});

  AppliedJobsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    appliedJobs =
        json['data'] != null ? AppliedJobs.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (appliedJobs != null) {
      data['data'] = appliedJobs!.toJson();
    }
    return data;
  }
}

class AppliedJobs {
  List<Job>? jobs;

  AppliedJobs({jobs});

  AppliedJobs.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      jobs = <Job>[];
      json['rows'].forEach((v) {
        jobs!.add(Job.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jobs != null) {
      data['rows'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Job {
  int? id;
  int? jobId;
  int? candidateId;
  int? cvId;
  String? message;
  String? status;
  int? companyId;
  int? createUser;
  int? updateUser;
  String? createdAt;
  String? updatedAt;
  JobInfo? jobInfo;
  CandidateInfo? candidateInfo;
  CvInfo? cvInfo;

  Job(
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
      cvInfo});

  Job.fromJson(Map<String, dynamic> json) {
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
    jobInfo =
        json['job_info'] != null ? JobInfo.fromJson(json['job_info']) : null;
    candidateInfo = json['candidate_info'] != null
        ? CandidateInfo.fromJson(json['candidate_info'])
        : null;
    cvInfo = json['cv_info'] != null ? CvInfo.fromJson(json['cv_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  int? updateUser;
  String? createdAt;
  String? updatedAt;
  String? applyType;
  dynamic applyLink;
  dynamic applyEmail;
  String? gallery;
  String? video;
  int? videoCoverId;
  int? numberRecruitments;
  String? isApproved;
  int? wageAgreement;

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
  int? updateUser;
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

  Experience({from, to, location, position, information});

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
  String? position;
  String? information;

  Award({from, to, location, position, information});

  Award.fromJson(Map<String, dynamic> json) {
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

class CvInfo {
  int? id;
  int? fileId;
  int? originId;
  int? isDefault;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;

  CvInfo(
      {id,
      fileId,
      originId,
      isDefault,
      createUser,
      updateUser,
      createdAt,
      updatedAt});

  CvInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['file_id'];
    originId = json['origin_id'];
    isDefault = json['is_default'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
