class CreateJobsModel {
  bool? error;
  bool? messages;
  CreateJobModel? createJobModel;

  CreateJobsModel({error, messages, data});

  CreateJobsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    createJobModel = json['data'] != null ?  CreateJobModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (createJobModel != null) {
      data['data'] = createJobModel!.toJson();
    }
    return data;
  }
}

class CreateJobModel {
  List<Categories>? categories;
  List<JobTypes>? jobTypes;
  List<JobSkills>? jobSkills;
  List<JobLocation>? jobLocation;
  DataRows? row;
  String? menuActive;
  String? pageTitle;
  List<dynamic>? translation;
  bool? isUserPage;

  CreateJobModel(
      {categories,
      jobTypes,
      jobSkills,
      jobLocation,
      row,
      menuActive,
      pageTitle,
      translation,
      isUserPage});

  CreateJobModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
    if (json['job_types'] != null) {
      jobTypes = <JobTypes>[];
      json['job_types'].forEach((v) {
        jobTypes!.add( JobTypes.fromJson(v));
      });
    }
    if (json['job_skills'] != null) {
      jobSkills = <JobSkills>[];
      json['job_skills'].forEach((v) {
        jobSkills!.add( JobSkills.fromJson(v));
      });
    }
    if (json['job_location'] != null) {
      jobLocation = <JobLocation>[];
      json['job_location'].forEach((v) {
        jobLocation!.add( JobLocation.fromJson(v));
      });
    }
    row = json['row'] != null ?  DataRows.fromJson(json['row']) : null;
    menuActive = json['menu_active'];
    pageTitle = json['page_title'];
    if (json['translation'] != null) {
      translation = <dynamic>[];
      json['translation'].forEach((v) {
        translation!.add(v);
      });
    }
    isUserPage = json['is_user_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (jobTypes != null) {
      data['job_types'] = jobTypes!.map((v) => v.toJson()).toList();
    }
    if (jobSkills != null) {
      data['job_skills'] = jobSkills!.map((v) => v.toJson()).toList();
    }
    if (jobLocation != null) {
      data['job_location'] = jobLocation!.map((v) => v.toJson()).toList();
    }
    if (row != null) {
      data['row'] = row!.toJson();
    }
    data['menu_active'] = menuActive;
    data['page_title'] = pageTitle;
    if (translation != null) {
      data['translation'] = translation!.map((v) => v.toJson()).toList();
    }
    data['is_user_page'] = isUserPage;
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

class JobTypes {
  int? id;
  String? name;
  dynamic slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  dynamic updatedAt;

  JobTypes(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  JobTypes.fromJson(Map<String, dynamic> json) {
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

class JobSkills {
  int? id;
  String? name;
  String? slug;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  JobSkills(
      {id,
      name,
      slug,
      status,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  JobSkills.fromJson(Map<String, dynamic> json) {
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

class JobLocation {
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

  JobLocation(
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

  JobLocation.fromJson(Map<String, dynamic> json) {
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

class DataRows {
  String? status;

  DataRows({status});

  DataRows.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}
