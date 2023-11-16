class CompanyProfileModel {
  bool? error;
  bool? messages;
  CompanyModel? companyModel;

  CompanyProfileModel({error, messages, companyModel});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    companyModel =
        json['data'] != null ? CompanyModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (companyModel != null) {
      data['data'] = companyModel!.toJson();
    }
    return data;
  }
}

class CompanyModel {
  Company? company;
  List<Categories>? categories;
  List<Attributes>? attributes;
  List<CompanyLocation>? companyLocation;
  Translation? translation;
  bool? enableMultiLang;
  String? pageTitle;
  String? menuActive;
  List<dynamic>? selectedTerms;
  bool? isUserPage;

  CompanyModel(
      {company,
      categories,
      attributes,
      companyLocation,
      translation,
      enableMultiLang,
      pageTitle,
      menuActive,
      selectedTerms,
      isUserPage});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    company = json['row'] != null ? Company.fromJson(json['row']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['company_location'] != null) {
      companyLocation = <CompanyLocation>[];
      json['company_location'].forEach((v) {
        companyLocation!.add(CompanyLocation.fromJson(v));
      });
    }
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    enableMultiLang = json['enable_multi_lang'];
    pageTitle = json['page_title'];
    menuActive = json['menu_active'];
    if (json['selected_terms'] != null) {
      selectedTerms = <dynamic>[];
      json['selected_terms'].forEach((v) {
        selectedTerms!.add(v);
      });
    }
    isUserPage = json['is_user_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data['row'] = company!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (companyLocation != null) {
      data['company_location'] =
          companyLocation!.map((v) => v.toJson()).toList();
    }
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    data['enable_multi_lang'] = enableMultiLang;
    data['page_title'] = pageTitle;
    data['menu_active'] = menuActive;
    if (selectedTerms != null) {
      data['selected_terms'] = selectedTerms!.map((v) => v.toJson()).toList();
    }
    data['is_user_page'] = isUserPage;
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
  List<dynamic>? companyTerm;

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
      companyTerm});

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
    if (json['company_term'] != null) {
      companyTerm = <dynamic>[];
      json['company_term'].forEach((v) {
        companyTerm!.add(v);
      });
    }
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
    if (companyTerm != null) {
      data['company_term'] = companyTerm!.map((v) => v.toJson()).toList();
    }
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

class Attributes {
  int? id;
  String? name;
  String? slug;
  String? service;
  dynamic createUser;
  dynamic updateUser;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic hideInSingle;
  dynamic hideInFilterSearch;
  dynamic position;

  Attributes(
      {id,
      name,
      slug,
      service,
      createUser,
      updateUser,
      createdAt,
      updatedAt,
      deletedAt,
      hideInSingle,
      hideInFilterSearch,
      position});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    service = json['service'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    hideInSingle = json['hide_in_single'];
    hideInFilterSearch = json['hide_in_filter_search'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['service'] = service;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['hide_in_single'] = hideInSingle;
    data['hide_in_filter_search'] = hideInFilterSearch;
    data['position'] = position;
    return data;
  }
}

class CompanyLocation {
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

  CompanyLocation(
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

  CompanyLocation.fromJson(Map<String, dynamic> json) {
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

class Translation {
  dynamic locale;
  int? originId;
  String? name;
  String? about;

  Translation({locale, originId, name, about});

  Translation.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    originId = json['origin_id'];
    name = json['name'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    data['origin_id'] = originId;
    data['name'] = name;
    data['about'] = about;
    return data;
  }
}
