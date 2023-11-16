class SocialMethodsModel {
  bool? error;
  Method? methods;

  SocialMethodsModel({this.error, this.methods});

  SocialMethodsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    methods = json['data'] != null ? Method.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (methods != null) {
      data['data'] = methods!.toJson();
    }
    return data;
  }
}

class Method {
  Social? facebook;
  Social? google;
  Social? twitter;
  Social? linkedin;

  Method({this.facebook, this.google, this.twitter, this.linkedin});

  Method.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'] != null
        ? Social.fromJson(json['facebook'])
        : null;
    google =
        json['google'] != null ? Social.fromJson(json['google']) : null;
    twitter =
        json['twitter'] != null ? Social.fromJson(json['twitter']) : null;
    linkedin = json['linkedin'] != null
        ? Social.fromJson(json['linkedin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (facebook != null) {
      data['facebook'] = facebook!.toJson();
    }
    if (google != null) {
      data['google'] = google!.toJson();
    }
    if (twitter != null) {
      data['twitter'] = twitter!.toJson();
    }
    if (linkedin != null) {
      data['linkedin'] = linkedin!.toJson();
    }
    return data;
  }
}

class Social {
  int? status;
  String? clientId;
  String? clientSecret;

  Social({this.status, this.clientId, this.clientSecret});

  Social.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    return data;
  }
}
