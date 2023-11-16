class PlansModel {
  bool? error;
  bool? messages;
  PlanModel? planModel;

  PlansModel({error, messages, data});

  PlansModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    planModel = json['data'] != null ? PlanModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (planModel != null) {
      data['data'] = planModel!.toJson();
    }
    return data;
  }
}

class PlanModel {
  String? pageTitle;
  List<Plan>? plans;
  dynamic user;

  PlanModel({pageTitle, plans, user});

  PlanModel.fromJson(Map<String, dynamic> json) {
    pageTitle = json['page_title'];
    if (json['plans'] != null) {
      plans = <Plan>[];
      json['plans'].forEach((v) {
        plans!.add(Plan.fromJson(v));
      });
    }
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page_title'] = pageTitle;
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    return data;
  }
}

class Plan {
  int? id;
  String? title;
  String? content;
  String? price;
  int? duration;
  String? durationType;
  String? annualPrice;
  int? maxService;
  String? status;
  int? roleId;
  int? isRecommended;
  dynamic deletedAt;
  dynamic createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;

  Plan(
      {id,
      title,
      content,
      price,
      duration,
      durationType,
      annualPrice,
      maxService,
      status,
      roleId,
      isRecommended,
      deletedAt,
      createUser,
      updateUser,
      createdAt,
      updatedAt});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    price = json['price'];
    duration = json['duration'];
    durationType = json['duration_type'];
    annualPrice = json['annual_price'];
    maxService = json['max_service'];
    status = json['status'];
    roleId = json['role_id'];
    isRecommended = json['is_recommended'];
    deletedAt = json['deleted_at'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['price'] = price;
    data['duration'] = duration;
    data['duration_type'] = durationType;
    data['annual_price'] = annualPrice;
    data['max_service'] = maxService;
    data['status'] = status;
    data['role_id'] = roleId;
    data['is_recommended'] = isRecommended;
    data['deleted_at'] = deletedAt;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
