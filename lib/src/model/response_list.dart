class ResponseList {
  final List<ItemList> listItem;

  ResponseList({this.listItem});

  factory ResponseList.fromJson(List<dynamic> json) {
    List<ItemList> list = List<ItemList>();
    list = json.map((i) => ItemList.fromJson(i)).toList();

    return ResponseList(listItem: list);
  }
}

class ItemList {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime created_at;
  final DateTime updated_at;

  ItemList({
    this.id,
    this.title,
    this.description,
    this.image,
    this.created_at,
    this.updated_at,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) => new ItemList(
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
        "created_at": created_at.toIso8601String(),
        "updated_at": updated_at.toIso8601String()
      };
}
