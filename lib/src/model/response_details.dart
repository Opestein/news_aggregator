class ItemDetails {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime created_at;
  final DateTime updated_at;

  ItemDetails({
    this.id,
    this.title,
    this.description,
    this.image,
    this.created_at,
    this.updated_at,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) => new ItemDetails(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        created_at: DateTime.parse(json["created_at"]),
        updated_at: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "created_at": created_at.toIso8601String,
        "updated_at": updated_at.toIso8601String
      };
}
