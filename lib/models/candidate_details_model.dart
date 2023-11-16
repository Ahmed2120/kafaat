class CandidateDetailsModel {
	bool? error;
	bool? messages;
	CandidateDetailModel? candidateDetailModel;

	CandidateDetailsModel({error, messages, data});

	CandidateDetailsModel.fromJson(Map<String, dynamic> json) {
		error = json['error'];
		messages = json['messages'];
		candidateDetailModel = json['data'] != null ?  CandidateDetailModel.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['error'] = error;
		data['messages'] = messages;
		if (candidateDetailModel != null) {
      data['data'] = candidateDetailModel!.toJson();
    }
		return data;
	}
}

class CandidateDetailModel {
	CandidateDetails? candidateDetails;
	Translation? translation;
	// ModelCategory? modelCategory;
	Cv? cv;
	String? customTitlePage;
	List<Gallery>? gallery;
	bool? headerTransparent;
	SeoMeta? seoMeta;

	CandidateDetailModel({candidateDetails, translation, modelCategory, cv, customTitlePage, gallery, headerTransparent, seoMeta});

	CandidateDetailModel.fromJson(Map<String, dynamic> json) {
		candidateDetails = json['row'] != null ?  CandidateDetails.fromJson(json['row']) : null;
		translation = json['translation'] != null ?  Translation.fromJson(json['translation']) : null;
		// modelCategory = json['model_category'] != null ?  ModelCategory.fromJson(json['model_category']) : null;
		cv = json['cv'] != null ?  Cv.fromJson(json['cv']) : null;
		customTitlePage = json['custom_title_page'];
		if (json['gallery'] != null) {
			gallery = <Gallery>[];
			json['gallery'].forEach((v) { gallery!.add( Gallery.fromJson(v)); });
		}
		headerTransparent = json['header_transparent'];
		seoMeta = json['seo_meta'] != null ?  SeoMeta.fromJson(json['seo_meta']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (candidateDetails != null) {
      data['row'] = candidateDetails!.toJson();
    }
		if (translation != null) {
      data['translation'] = translation!.toJson();
    }
		// if (modelCategory != null) {
    //   data['model_category'] = modelCategory!.toJson();
    // }
		if (cv != null) {
      data['cv'] = cv!.toJson();
    }
		data['custom_title_page'] = customTitlePage;
		if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
		data['header_transparent'] = headerTransparent;
		if (seoMeta != null) {
      data['seo_meta'] = seoMeta!.toJson();
    }
		return data;
	}
}

class CandidateDetails {
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
	List<Skills>? skills;
	List<Categories>? categories;
	User? user;

	CandidateDetails({id, title, website, gender, gallery, video, allowSearch, education, experience, award, socialMedia, languages, educationLevel, experienceYear, expectedSalary, salaryType, locationId, mapLat, mapLng, mapZoom, city, country, address, createUser, updateUser, slug, deletedAt, originId, lang, createdAt, updatedAt, videoCoverId, skills, categories, user});

	CandidateDetails.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		website = json['website'];
		gender = json['gender'];
		gallery = json['gallery'];
		video = json['video'];
		allowSearch = json['allow_search'];
		if (json['education'] != null) {
			education = <Education>[];
			json['education'].forEach((v) { education!.add( Education.fromJson(v)); });
		}
		if (json['experience'] != null) {
			experience = <Experience>[];
			json['experience'].forEach((v) { experience!.add( Experience.fromJson(v)); });
		}
		if (json['award'] != null) {
			award = <Award>[];
			json['award'].forEach((v) { award!.add( Award.fromJson(v)); });
		}
		socialMedia = json['social_media'] != null ?  SocialMedia.fromJson(json['social_media']) : null;
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
		if (json['skills'] != null) {
			skills = <Skills>[];
			json['skills'].forEach((v) { skills!.add( Skills.fromJson(v)); });
		}
		if (json['categories'] != null) {
			categories = <Categories>[];
			json['categories'].forEach((v) { categories!.add( Categories.fromJson(v)); });
		}
		user = json['user'] != null ?  User.fromJson(json['user']) : null;
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
		if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
		if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
		if (user != null) {
      data['user'] = user!.toJson();
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

class SocialMedia {
	String? skype;
	String? facebook;
	String? twitter;
	String? instagram;
	String? pinterest;
	String? dribbble;
	String? google;
	String? linkedin;

	SocialMedia({skype, facebook, twitter, instagram, pinterest, dribbble, google, linkedin});

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

class Skills {
	int? id;
	String? name;
	String? slug;
	String? status;
	dynamic createUser;
	dynamic updateUser;
	dynamic deletedAt;
	String? createdAt;
	String? updatedAt;
	Pivot? pivot;

	Skills({id, name, slug, status, createUser, updateUser, deletedAt, createdAt, updatedAt, pivot});

	Skills.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		slug = json['slug'];
		status = json['status'];
		createUser = json['create_user'];
		updateUser = json['update_user'];
		deletedAt = json['deleted_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		pivot = json['pivot'] != null ?  Pivot.fromJson(json['pivot']) : null;
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
		if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
		return data;
	}
}

class Pivot {
	int? originId;
	int? skillId;

	Pivot({originId, skillId});

	Pivot.fromJson(Map<String, dynamic> json) {
		originId = json['origin_id'];
		skillId = json['skill_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['origin_id'] = originId;
		data['skill_id'] = skillId;
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

	Categories({id, name, content, slug, status, originId, icon, lang, iLft, iRgt, parentId, createUser, updateUser, deletedAt, createdAt, updatedAt, pivot});

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
		pivot = json['pivot'] != null ?  Pivot.fromJson(json['pivot']) : null;
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

class User {
	int? id;
	String? name;
	String? firstName;
	String? lastName;
	String? email;
	dynamic emailVerifiedAt;
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

	User({id, name, firstName, lastName, email, emailVerifiedAt, phone, birthday, lastLoginAt, avatarId, bio, status, createUser, updateUser, vendorCommissionAmount, vendorCommissionType, roleId, billingLastName, billingFirstName, country, state, city, zipCode, address, address2, deletedAt, createdAt, updatedAt, paymentGateway, totalGuests, locale, verifySubmitStatus, isVerified, needUpdatePw});

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

class Translation {
	String? locale;
	int? originId;
	String? title;

	Translation({locale, originId, title});

	Translation.fromJson(Map<String, dynamic> json) {
		locale = json['locale'];
		originId = json['origin_id'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['locale'] = locale;
		data['origin_id'] = originId;
		data['title'] = title;
		return data;
	}
}


class Cv {
	int? id;
	int? fileId;
	int? originId;
	int? isDefault;
	int? createUser;
	dynamic updateUser;
	String? createdAt;
	dynamic updatedAt;

	Cv({id, fileId, originId, isDefault, createUser, updateUser, createdAt, updatedAt});

	Cv.fromJson(Map<String, dynamic> json) {
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

class Gallery {
	String? large;
	String? thumb;

	Gallery({large, thumb});

	Gallery.fromJson(Map<String, dynamic> json) {
		large = json['large'];
		thumb = json['thumb'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['large'] = large;
		data['thumb'] = thumb;
		return data;
	}
}

class SeoMeta {
	String? slug;
	String? fullUrl;
	String? serviceTitle;
	dynamic serviceDesc;
	dynamic serviceImage;

	SeoMeta({slug, fullUrl, serviceTitle, serviceDesc, serviceImage});

	SeoMeta.fromJson(Map<String, dynamic> json) {
		slug = json['slug'];
		fullUrl = json['full_url'];
		serviceTitle = json['service_title'];
		serviceDesc = json['service_desc'];
		serviceImage = json['service_image'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['slug'] = slug;
		data['full_url'] = fullUrl;
		data['service_title'] = serviceTitle;
		data['service_desc'] = serviceDesc;
		data['service_image'] = serviceImage;
		return data;
	}
}
