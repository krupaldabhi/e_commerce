class CategoryModel {
  String id;
  String title;
  String photo;
  String isLive;
  String isDeleted;

  CategoryModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.isLive,
    required this.isDeleted,
  });

  // From JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      photo: json['photo'] ?? '',
      isLive: json['islive'] ?? '',
      isDeleted: json['isdeleted'] ?? '',
    );
  }

  // To JSON (Optional)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "photo": photo,
      "islive": isLive,
      "isdeleted": isDeleted,
    };
  }
}
