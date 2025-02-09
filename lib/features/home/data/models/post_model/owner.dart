class Owner {
  int? id;
  String? name;

  Owner({this.id, this.name});

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
