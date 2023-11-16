class WishlistsModel {
  bool? error;
  bool? messages;
  List<Wishlist>? wishlists;

  WishlistsModel({error, messages, wishlists});

  WishlistsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    messages = json['messages'];
    if (json['data'] != null) {
      wishlists = <Wishlist>[];
      json['data'].forEach((v) {
        wishlists!.add(Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['messages'] = messages;
    if (wishlists != null) {
      data['data'] = wishlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wishlist {
  int? id;
  int? objectId;
  String? objectModel;
  int? userId;
  int? createUser;
  dynamic updateUser;
  String? createdAt;
  String? updatedAt;

  Wishlist(
      {id,
      objectId,
      objectModel,
      userId,
      createUser,
      updateUser,
      createdAt,
      updatedAt});

  Wishlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    objectModel = json['object_model'];
    userId = json['user_id'];
    createUser = json['create_user'];
    updateUser = json['update_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object_id'] = objectId;
    data['object_model'] = objectModel;
    data['user_id'] = userId;
    data['create_user'] = createUser;
    data['update_user'] = updateUser;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
