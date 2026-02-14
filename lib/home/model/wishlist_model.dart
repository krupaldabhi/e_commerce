class WishlistModel {
  String id;
  String title;
  String price;
  String weight;
  String size;
  String photo;
  String detail;
  String wishlistId;

  WishlistModel({
    required this.id,
    required this.title,
    required this.price,
    required this.weight,
    required this.size,
    required this.photo,
    required this.detail,
    required this.wishlistId,
  });

  // Convert JSON to Object
  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      weight: json['weight'] ?? '',
      size: json['size'] ?? '',
      photo: json['photo'] ?? '',
      detail: json['detail'] ?? '',
      wishlistId: json['wishlistid'] ?? '',
    );
  }

  // Convert Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'weight': weight,
      'size': size,
      'photo': photo,
      'detail': detail,
      'wishlistid': wishlistId,
    };
  }
}
