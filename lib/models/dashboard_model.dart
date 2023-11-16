class DashboardModel {
  List<TopCards>? topCards;
  List<dynamic>? notifications;
  ViewsChartData? viewsChartData;
  String? pageTitle;
  String? menuActive;

  DashboardModel(
      {topCards, notifications, viewsChartData, pageTitle, menuActive});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['top_cards'] != null) {
      topCards = <TopCards>[];
      json['top_cards'].forEach((v) {
        topCards!.add(TopCards.fromJson(v));
      });
    }
    if (json['notifications'] != null) {
      notifications = [];
      // json['notifications'].forEach((v) { notifications!.add( Null.fromJson(v)); });
    }
    viewsChartData = json['views_chart_data'] != null
        ? ViewsChartData.fromJson(json['views_chart_data'])
        : null;
    pageTitle = json['page_title'];
    menuActive = json['menu_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topCards != null) {
      data['top_cards'] = topCards!.map((v) => v.toJson()).toList();
    }
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    if (viewsChartData != null) {
      data['views_chart_data'] = viewsChartData!.toJson();
    }
    data['page_title'] = pageTitle;
    data['menu_active'] = menuActive;
    return data;
  }
}

class TopCards {
  int? size;
  int? sizeMd;
  String? color;
  String? title;
  int? amount;
  String? desc;
  String? clas;
  String? icon;
  String? icon2;

  TopCards({size, sizeMd, color, title, amount, desc, clas, icon, icon2});

  TopCards.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    sizeMd = json['size_md'];
    color = json['color'];
    title = json['title'];
    amount = json['amount'];
    desc = json['desc'];
    clas = json['class'];
    icon = json['icon'];
    icon2 = json['icon2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['size_md'] = sizeMd;
    data['color'] = color;
    data['title'] = title;
    data['amount'] = amount;
    data['desc'] = desc;
    data['class'] = clas;
    data['icon'] = icon;
    data['icon2'] = icon2;
    return data;
  }
}

class ViewsChartData {
  List<String>? labels;
  List<Datasets>? datasets;

  ViewsChartData({labels, datasets});

  ViewsChartData.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    if (json['datasets'] != null) {
      datasets = <Datasets>[];
      json['datasets'].forEach((v) {
        datasets!.add(Datasets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labels'] = labels;
    if (datasets != null) {
      data['datasets'] = datasets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datasets {
  String? label;
  String? backgroundColor;
  String? borderColor;
  String? borderWidth;
  List<double>? data = [];
  int? pointRadius;
  int? pointHoverRadius;
  int? pointHitRadius;
  String? pointBackgroundColor;
  String? pointHoverBackgroundColor;
  String? pointBorderWidth;

  Datasets(
      {label,
      backgroundColor,
      borderColor,
      borderWidth,
      data,
      pointRadius,
      pointHoverRadius,
      pointHitRadius,
      pointBackgroundColor,
      pointHoverBackgroundColor,
      pointBorderWidth});

  Datasets.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    backgroundColor = json['backgroundColor'];
    borderColor = json['borderColor'];
    borderWidth = json['borderWidth'];
    for (var v in (json['data'] as List)) {
      data!.add(double.parse(v.toString()));
    }
    pointRadius = json['pointRadius'];
    pointHoverRadius = json['pointHoverRadius'];
    pointHitRadius = json['pointHitRadius'];
    pointBackgroundColor = json['pointBackgroundColor'];
    pointHoverBackgroundColor = json['pointHoverBackgroundColor'];
    pointBorderWidth = json['pointBorderWidth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['backgroundColor'] = backgroundColor;
    data['borderColor'] = borderColor;
    data['borderWidth'] = borderWidth;
    data['data'] = data;
    data['pointRadius'] = pointRadius;
    data['pointHoverRadius'] = pointHoverRadius;
    data['pointHitRadius'] = pointHitRadius;
    data['pointBackgroundColor'] = pointBackgroundColor;
    data['pointHoverBackgroundColor'] = pointHoverBackgroundColor;
    data['pointBorderWidth'] = pointBorderWidth;
    return data;
  }
}

class BannersModel {
  int? status;
  bool? error;
  List<BannerModel>? banners;

  BannersModel({status, error, data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      banners = <BannerModel>[];
      json['data'].forEach((v) {
        banners!.add(BannerModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    if (banners != null) {
      data['data'] = banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerModel {
  int? id;
  String? name;
  String? photo;
  String? createdAt;
  String? updatedAt;
  dynamic createUser;

  BannerModel({id, name, photo, createdAt, updatedAt, createUser});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createUser = json['create_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['create_user'] = createUser;
    return data;
  }
}
