class Following {
  int? id;
  String? name;
  dynamic imageUrl;

  Following({this.id, this.name, this.imageUrl});

  factory Following.fromJson(Map<String, dynamic> json) => Following(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
