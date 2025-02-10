class Follower {
  int? id;
  String? name;
  dynamic imageUrl;

  Follower({this.id, this.name, this.imageUrl});

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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
