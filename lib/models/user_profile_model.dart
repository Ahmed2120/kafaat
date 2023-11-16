class UserProfileModel {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic phone;
  dynamic birthday;
  dynamic lastLoginAt;
  dynamic avatarId;
  dynamic bio;
  String? status;
  dynamic createUser;
  dynamic updateUser;
  dynamic vendorCommissionAmount;
  dynamic vendorCommissionType;
  int? roleId;
  dynamic billingLastName;
  dynamic billingFirstName;
  dynamic country;
  dynamic state;
  dynamic city;
  dynamic zipCode;
  dynamic address;
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

  UserProfileModel({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.birthday,
    this.lastLoginAt,
    this.avatarId,
    this.bio,
    this.status,
    this.createUser,
    this.updateUser,
    this.vendorCommissionAmount,
    this.vendorCommissionType,
    this.roleId,
    this.billingLastName,
    this.billingFirstName,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.address,
    this.address2,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.paymentGateway,
    this.totalGuests,
    this.locale,
    this.verifySubmitStatus,
    this.isVerified,
    this.needUpdatePw,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
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
