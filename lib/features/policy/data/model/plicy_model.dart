class PolicyModel {
  int id;
  String createdAt;
  String? title;
  String? subTitle;
  String? body;

  PolicyModel({
    required this.id,
    required this.createdAt,
    this.title,
    this.subTitle,
    this.body,
  });

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
        id: json["id"],
        createdAt: json["created_at"],
        title: json["title"],
        subTitle: json["sub_title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "title": title,
        "sub_title": subTitle,
        "body": body,
      };
}
