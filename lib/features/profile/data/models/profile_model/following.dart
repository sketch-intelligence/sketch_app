import 'package:hive/hive.dart';

part 'following.g.dart';

@HiveType(typeId: 6) // Unique ID for Hive Adapter
class Following {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  dynamic imageUrl; // Consider converting to String if needed.

  Following({this.id, this.name, this.imageUrl});

  factory Following.fromJson(Map<String, dynamic> json) => Following(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
