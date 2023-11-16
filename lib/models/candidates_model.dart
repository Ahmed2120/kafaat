class CandidatesModel {
  bool? error;
  bool? messages;
  CandidateModel? candidateModel;

  CandidatesModel({error, messages, candidateModel});

  CandidatesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    candidateModel = json['data'] != null ? CandidateModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (candidateModel != null) {
      data['data'] = candidateModel!.toJson();
    }
    return data;
  }
}

class CandidateModel {
  Candidates? candidates;
  List<ListLocations>? listLocations;
  List<ListCategories>? listCategories;
  List<ListSkills>? listSkills;
  List<String>? minMaxPrice;
  dynamic filter;
  SeoMeta? seoMeta;
  List<Markers>? markers;

  CandidateModel(
      {candidates,
      listLocations,
      listCategories,
      listSkills,
      minMaxPrice,
      filter,
      seoMeta,
      markers});

  CandidateModel.fromJson(Map<String, dynamic> json) {
    candidates = json['rows'] != null ? Candidates.fromJson(json['rows']) : null;
    if (json['list_locations'] != null) {
      listLocations = <ListLocations>[];
      json['list_locations'].forEach((v) {
        listLocations!.add(ListLocations.fromJson(v));
      });
    }
    if (json['list_categories'] != null) {
      listCategories = <ListCategories>[];
      json['list_categories'].forEach((v) {
        listCategories!.add(ListCategories.fromJson(v));
      });
    }
    if (json['list_skills'] != null) {
      listSkills = <ListSkills>[];
      json['list_skills'].forEach((v) {
        listSkills!.add(ListSkills.fromJson(v));
      });
    }
    minMaxPrice = json['min_max_price'].cast<String>();
    filter = json['filter'];
    seoMeta =
        json['seo_meta'] != null ? SeoMeta.fromJson(json['seo_meta']) : null;
    if (json['markers'] != null) {
      markers = <Markers>[];
      json['markers'].forEach((v) {
        markers!.add(Markers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (candidates != null) {
      data['rows'] = candidates!.toJson();
    }
    if (listLocations != null) {
      data['list_locations'] = listLocations!.map((v) => v).toList();
    }
    if (listCategories != null) {
      data['list_categories'] = listCategories!.map((v) => v).toList();
    }
    if (listSkills != null) {
      data['list_skills'] = listSkills!.map((v) => v).toList();
    }
    data['min_max_price'] = minMaxPrice;
    data['filter'] = filter;
    if (seoMeta != null) {
      data['seo_meta'] = seoMeta!.toJson();
    }
    if (markers != null) {
      data['markers'] = markers!.map((v) => v).toList();
    }
    return data;
  }
}

class Candidates {
  int? currentPage;
  List<Candidate>? candidates;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Candidates(
      {currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total});

  Candidates.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      candidates = <Candidate>[];
      json['data'].forEach((v) {
        candidates!.add(Candidate.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (candidates != null) {
      data['data'] = candidates!.map((v) => v).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Candidate {
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
  dynamic updatedAt;
  int? videoCoverId;
  List<dynamic>? translations;
  dynamic wishlist;
  User? user;
  List<Categories>? categories;

  Candidate(
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
      videoCoverId,
      translations,
      wishlist,
      user,
      categories});

  Candidate.fromJson(Map<String, dynamic> json) {
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
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(v);
      });
    }
    wishlist = json['wishlist'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
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
      data['education'] = education!.map((v) => v).toList();
    }
    if (experience != null) {
      data['experience'] = experience!.map((v) => v).toList();
    }
    if (award != null) {
      data['award'] = award!.map((v) => v).toList();
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
    if (translations != null) {
      data['translations'] = translations!.map((v) => v).toList();
    }
    data['wishlist'] = wishlist;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v).toList();
    }
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
  Pivot? pivot;

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
      pivot});

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
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? originId;
  int? catId;

  Pivot({originId, catId});

  Pivot.fromJson(Map<String, dynamic> json) {
    originId = json['origin_id'];
    catId = json['cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin_id'] = originId;
    data['cat_id'] = catId;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({url, label, active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class ListLocations {
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

  ListLocations(
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

  ListLocations.fromJson(Map<String, dynamic> json) {
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
      data['children'] = children!.map((v) => v).toList();
    }
    return data;
  }
}

class ListCategories {
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

  ListCategories(
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

  ListCategories.fromJson(Map<String, dynamic> json) {
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
      data['children'] = children!.map((v) => v).toList();
    }
    return data;
  }
}

class ListSkills {
  int? id;
  String? name;
  String? slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  ListSkills(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  ListSkills.fromJson(Map<String, dynamic> json) {
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

class SeoMeta {
  String? seoTitle;
  String? seoDesc;
  dynamic seoImage;
  String? seoShare;
  String? fullUrl;

  SeoMeta({seoTitle, seoDesc, seoImage, seoShare, fullUrl});

  SeoMeta.fromJson(Map<String, dynamic> json) {
    seoTitle = json['seo_title'];
    seoDesc = json['seo_desc'];
    seoImage = json['seo_image'];
    seoShare = json['seo_share'];
    fullUrl = json['full_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seo_title'] = seoTitle;
    data['seo_desc'] = seoDesc;
    data['seo_image'] = seoImage;
    data['seo_share'] = seoShare;
    data['full_url'] = fullUrl;
    return data;
  }
}

class Markers {
  int? id;
  String? title;
  double? lat;
  double? lng;
  String? infobox;
  String? customMarker;

  Markers({id, title, lat, lng, infobox, customMarker});

  Markers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lat = json['lat'];
    lng = json['lng'];
    infobox = json['infobox'];
    customMarker = json['customMarker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['lat'] = lat;
    data['lng'] = lng;
    data['infobox'] = infobox;
    data['customMarker'] = customMarker;
    return data;
  }
}
