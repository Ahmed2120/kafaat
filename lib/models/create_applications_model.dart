class CreateApplicantsModel {
  bool? error;
  bool? messages;
  CreateApplicantModel? createApplicantModel;

  CreateApplicantsModel({error, messages, data});

  CreateApplicantsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    createApplicantModel = json['data'] != null
        ? CreateApplicantModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (createApplicantModel != null) {
      data['data'] = createApplicantModel!.toJson();
    }
    return data;
  }
}

class CreateApplicantModel {
  DataRows? rows;
  List<Candidate>? candidates;
  List<Job>? jobs;
  String? pageTitle;
  String? menuActive;
  List<dynamic>? translation;

  CreateApplicantModel(
      {row, candidate, job, pageTitle, menuActive, translation});

  CreateApplicantModel.fromJson(Map<String, dynamic> json) {
    rows = json['row'] != null ? DataRows.fromJson(json['row']) : null;
    if (json['candidate'] != null) {
      candidates = <Candidate>[];
      json['candidate'].forEach((v) {
        candidates!.add(Candidate.fromJson(v));
      });
    }
    if (json['job'] != null) {
      jobs = <Job>[];
      json['job'].forEach((v) {
        jobs!.add(Job.fromJson(v));
      });
    }
    pageTitle = json['page_title'];
    menuActive = json['menu_active'];
    if (json['translation'] != null) {
      translation = <dynamic>[];
      json['translation'].forEach((v) {
        translation!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['row'] = rows!.toJson();
    }
    if (candidates != null) {
      data['candidate'] = candidates!.map((v) => v.toJson()).toList();
    }
    if (jobs != null) {
      data['job'] = jobs!.map((v) => v.toJson()).toList();
    }
    data['page_title'] = pageTitle;
    data['menu_active'] = menuActive;
    if (translation != null) {
      data['translation'] = translation!.map((v) => v.toJson()).toList();
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

class Candidate {
  int? id;
  String? title;

  Candidate({id, title});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class Job {
  int? id;
  String? title;

  Job({id, title});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
