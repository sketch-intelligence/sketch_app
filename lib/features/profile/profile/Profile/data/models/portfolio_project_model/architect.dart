class Architect {
  int? id;
  String? name;
  dynamic userName;
  dynamic imageUrl;
  dynamic followers;
  dynamic following;

  Architect({
    this.id,
    this.name,
    this.userName,
    this.imageUrl,
    this.followers,
    this.following,
  });

  factory Architect.fromJson(Map<String, dynamic> json) => Architect(
        id: json['id'] as int?,
        name: json['name'] as String?,
        userName: json['userName'] as dynamic,
        imageUrl: json['imageUrl'] as dynamic,
        followers: json['followers'] as dynamic,
        following: json['following'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'userName': userName,
        'imageUrl': imageUrl,
        'followers': followers,
        'following': following,
      };
}
