class Owner {
  int? id;
  String? name;
  String? imageUrl;
  Owner({this.id, this.name, this.imageUrl});

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'imageUrl': imageUrl};
}
