class JobFilters {
  String? keyword;
  int? location;
  int? category;
  List<String>? jobTypes;
  String? datePosted;
  List<String>? experiences;
  double? amountFrom;
  double? amountTo;

  JobFilters({
    this.keyword,
    this.location,
    this.category,
    this.jobTypes,
    this.datePosted,
    this.experiences,
    this.amountFrom,
    this.amountTo,
  });

  String toStr() {
    String str = '?';
    if (keyword != null) str += 's=$keyword&';
    if (location != null) str += 'location=$location&';
    if (category != null) str += 'category=$category&';
    if (jobTypes != null) {
      for (var jobType in jobTypes!) {
        str += 'job_type%5B%5D=$jobType&';
      }
    }
    if (datePosted != null) str += 'date_posted=$datePosted&';
    if (experiences != null) {
      for (var experience in experiences!) {
        str += 'experience%5B%5D=$experience&';
      }
    }
    if (amountFrom != null) str += 'amount_from=$amountFrom&';
    if (amountTo != null) str += 'amount_to=$amountTo';
    return str;
  }

  bool get isAllNullVars {
    return (keyword == null &&
        location == null &&
        category == null &&
        jobTypes == null &&
        datePosted == null &&
        experiences == null &&
        amountFrom == null &&
        amountTo == null);
  }
}

class EmployerFilters {
  String? keyword;
  int? location;
  int? category;
  String? datePosted;
  List<String>? companySize;
  double? fromDate;
  double? toDate;

  EmployerFilters({
    this.keyword,
    this.location,
    this.category,
    this.datePosted,
    this.companySize,
    this.fromDate,
    this.toDate,
  });

  String toStr() {
    String str = '?';
    if (keyword != null) str += 's=$keyword&';
    if (location != null) str += 'location=$location&';
    if (category != null) str += 'category=$category&';
    if (datePosted != null) str += 'date_posted=$datePosted&';
    if (companySize != null) {
      for (var terms in companySize!) {
        str += 'terms%5B%5D=$terms&';
      }
    }
    if (fromDate != null) str += 'amount_from=$fromDate&';
    if (toDate != null) str += 'amount_to=$toDate';
    return str;
  }

  bool get isAllNullVars {
    return (keyword == null &&
        location == null &&
        category == null &&
        datePosted == null &&
        companySize == null &&
        fromDate == null &&
        toDate == null);
  }
}

class CandidateFilters {
  String? keyword;
  int? location;
  int? category;
  int? skill;
  String? datePosted;
  List<String>? experiences;
  List<String>? educationLevels;

  CandidateFilters({
    this.keyword,
    this.location,
    this.category,
    this.skill,
    this.educationLevels,
    this.datePosted,
    this.experiences,
  });

  String toStr() {
    String str = '?';
    if (keyword != null) str += 's=$keyword&';
    if (location != null) str += 'location=$location&';
    if (category != null) str += 'category=$category&';
    if (skill != null) str += 'skill=$skill&';
    if (datePosted != null) str += 'date_posted=$datePosted&';
    if (experiences != null) {
      for (var experience in experiences!) {
        str += 'experience_year%5B%5D=$experience&';
      }
    }
    if (educationLevels != null) {
      for (var educationLevel in educationLevels!) {
        str += 'education_level%5B%5D=$educationLevel&';
      }
    }
    return str;
  }

  bool get isAllNullVars {
    return (keyword == null &&
        location == null &&
        category == null &&
        skill == null &&
        experiences == null &&
        datePosted == null &&
        educationLevels == null);
  }
}
