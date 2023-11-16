class EmployersModel {
  bool? error;
  bool? messages;
  EmployerModel? employerModel;

  EmployersModel({error, messages, data});

  EmployersModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    employerModel =
        json['data'] != null ? EmployerModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (employerModel != null) {
      data['data'] = employerModel!.toJson();
    }
    return data;
  }
}

class EmployerModel {
  Employers? employers;
  List<ListLocations>? listLocations;
  List<Categories>? categories;
  List<Attributes>? attributes;
  List<dynamic>? modelTag;
  String? pageTitle;
  List<Breadcrumbs>? breadcrumbs;
  String? bodyClass;
  SeoMeta? seoMeta;
  List<Languages>? languages;
  String? locale;
  List<Markers>? markers;

  EmployerModel(
      {employers,
      listLocations,
      categories,
      attributes,
      modelTag,
      pageTitle,
      breadcrumbs,
      bodyClass,
      seoMeta,
      languages,
      locale,
      markers});

  EmployerModel.fromJson(Map<String, dynamic> json) {
    employers = json['rows'] != null ? Employers.fromJson(json['rows']) : null;
    if (json['list_locations'] != null) {
      listLocations = <ListLocations>[];
      json['list_locations'].forEach((v) {
        listLocations!.add(ListLocations.fromJson(v));
      });
    }
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
    if (json['model_tag'] != null) {
      modelTag = <dynamic>[];
      json['model_tag'].forEach((v) {
        modelTag!.add(v);
      });
    }
    pageTitle = json['page_title'];
    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(Breadcrumbs.fromJson(v));
      });
    }
    bodyClass = json['body_class'];
    seoMeta =
        json['seo_meta'] != null ? SeoMeta.fromJson(json['seo_meta']) : null;
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    locale = json['locale'];
    if (json['markers'] != null) {
      markers = <Markers>[];
      json['markers'].forEach((v) {
        markers!.add(Markers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employers != null) {
      data['rows'] = employers!.toJson();
    }
    if (listLocations != null) {
      data['list_locations'] = listLocations!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (modelTag != null) {
      data['model_tag'] = modelTag!.map((v) => v.toJson()).toList();
    }
    data['page_title'] = pageTitle;
    if (breadcrumbs != null) {
      data['breadcrumbs'] = breadcrumbs!.map((v) => v.toJson()).toList();
    }
    data['body_class'] = bodyClass;
    if (seoMeta != null) {
      data['seo_meta'] = seoMeta!.toJson();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    data['locale'] = locale;
    if (markers != null) {
      data['markers'] = markers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employers {
  int? currentPage;
  List<Employer>? employers;
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

  Employers(
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

  Employers.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      employers = <Employer>[];
      json['data'].forEach((v) {
        employers!.add(Employer.fromJson(v));
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
    if (employers != null) {
      data['data'] = employers!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
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

class Employer {
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
  int? jobCount;
  Category? category;
  Location? location;
  dynamic wishlist;

  Employer(
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
      jobCount,
      category,
      location,
      wishlist});

  Employer.fromJson(Map<String, dynamic> json) {
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
    jobCount = json['job_count'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    wishlist = json['wishlist'];
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
    data['job_count'] = jobCount;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['wishlist'] = wishlist;
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
  List<dynamic>? translations;
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
      translations,
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
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(v);
      });
    }
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
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
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

class Breadcrumbs {
  String? name;
  String? url;
  String? clas;

  Breadcrumbs({name, url, clas});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    clas = json['class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['class'] = clas;
    return data;
  }
}

class SeoMeta {
  String? seoTitle;
  String? seoDesc;
  bool? seoImage;
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

class Markers {
  int? id;
  dynamic title;
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
