class MyOrdersModel {
  bool? error;
  bool? messages;
  List<OrdersModel>? ordersModel;

  MyOrdersModel({error, messages, ordersModel});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    if (json['data'] != null) {
      ordersModel = <OrdersModel>[];
      json['data'].forEach((v) {
        ordersModel!.add(OrdersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (ordersModel != null) {
      data['data'] = ordersModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrdersModel {
  int? id;
  int? orderId;
  int? objectId;
  String? objectModel;
  String? price;
  int? qty;
  int? subtotal;
  String? status;
  List<dynamic>? meta;
  int? createUser;
  dynamic updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Product? product;
  Order? order;

  OrdersModel(
      {id,
      orderId,
      objectId,
      objectModel,
      price,
      qty,
      subtotal,
      status,
      meta,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt,
      product,
      order});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
    price = json['price'];
    qty = json['qty'];
    subtotal = json['subtotal'];
    status = json['status'];
    if (json['meta'] != null) {
      meta = <dynamic>[];
      json['meta'].forEach((v) {
        meta!.add(v);
      });
    }
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['object_id'] = objectId;
    data['object_model'] = objectModel;
    data['price'] = price;
    data['qty'] = qty;
    data['subtotal'] = subtotal;
    data['status'] = status;
    if (meta != null) {
      data['meta'] = meta!.map((v) => v.toJson()).toList();
    }
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Product {
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

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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

class Order {
  int? id;
  int? customerId;
  String? subtotal;
  String? total;
  int? paymentId;
  dynamic gateway;
  String? status;
  dynamic paid;
  Billing? billing;
  int? createUser;
  int? updateUser;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Order(
      {id,
      customerId,
      subtotal,
      total,
      paymentId,
      gateway,
      status,
      paid,
      billing,
      createUser,
      updateUser,
      deletedAt,
      createdAt,
      updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    subtotal = json['subtotal'];
    total = json['total'];
    paymentId = json['payment_id'];
    gateway = json['gateway'];
    status = json['status'];
    paid = json['paid'];
    billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    createUser = json['create_user'];
    updateUser = json['update_user'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['subtotal'] = subtotal;
    data['total'] = total;
    data['payment_id'] = paymentId;
    data['gateway'] = gateway;
    data['status'] = status;
    data['paid'] = paid;
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Billing {
  String? firstName;
  String? lastName;
  String? phone;
  String? country;
  String? address;
  dynamic address2;
  String? state;
  String? city;
  String? zipCode;

  Billing(
      {firstName,
      lastName,
      phone,
      country,
      address,
      address2,
      state,
      city,
      zipCode});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    country = json['country'];
    address = json['address'];
    address2 = json['address2'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['country'] = country;
    data['address'] = address;
    data['address2'] = address2;
    data['state'] = state;
    data['city'] = city;
    data['zip_code'] = zipCode;
    return data;
  }
}
