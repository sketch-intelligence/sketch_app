import 'package:hive/hive.dart';

part 'follower.g.dart';

@HiveType(typeId: 5) // Unique ID for Hive Adapter
class Follower {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  dynamic
      imageUrl; // You may consider converting this to a String for Hive compatibility.

  Follower({this.id, this.name, this.imageUrl});

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
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
