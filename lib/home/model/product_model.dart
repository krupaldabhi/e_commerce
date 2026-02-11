class ProductModel {
  String id;
  String categoryId;
  String title;
  String price;
  String stock;
  String weight;
  String size;
  String photo;
  String detail;
  String isLive;
  String isDeleted;
  String categoryTitle;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.price,
    required this.stock,
    required this.weight,
    required this.size,
    required this.photo,
    required this.detail,
    required this.isLive,
    required this.isDeleted,
    required this.categoryTitle,
  });

  /// Convert JSON to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      categoryId: json['categoryid']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      stock: json['stock']?.toString() ?? '',
      weight: json['weight']?.toString() ?? '',
      size: json['size']?.toString() ?? '',
      photo: json['photo']?.toString() ?? '',
      detail: json['detail']?.toString() ?? '',
      isLive: json['islive']?.toString() ?? '',
      isDeleted: json['isdeleted']?.toString() ?? '',
      categoryTitle: json['categorytitle']?.toString() ?? '',
    );
  }

  /// Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryid': categoryId,
      'title': title,
      'price': price,
      'stock': stock,
      'weight': weight,
      'size': size,
      'photo': photo,
      'detail': detail,
      'islive': isLive,
      'isdeleted': isDeleted,
      'categorytitle': categoryTitle,
    };
  }
}
