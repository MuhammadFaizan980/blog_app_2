class PostModel {
  String? sId;
  String? title;
  String? description;
  String? userId;
  String? createdAt;
  String? updatedAt;

  PostModel({
    this.sId,
    this.title,
    this.description,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
