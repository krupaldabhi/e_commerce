class CartModel {
  String id;
  String cartId;
  String title;
  String price;
  String quantity;
  String weight;
  String size;
  String photo;
  String detail;

  CartModel({
    required this.id,
    required this.cartId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.weight,
    required this.size,
    required this.photo,
    required this.detail,
  });

  /// JSON → Model
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id']?.toString() ?? '',
      cartId: json['cartid']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      quantity: json['quantity']?.toString() ?? '',
      weight: json['weight']?.toString() ?? '',
      size: json['size']?.toString() ?? '',
      photo: json['photo']?.toString() ?? '',
      detail: json['detail']?.toString() ?? '',
    );
  }

  /// Model → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cartid': cartId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'weight': weight,
      'size': size,
      'photo': photo,
      'detail': detail,
    };
  }
}
