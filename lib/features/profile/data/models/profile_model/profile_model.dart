import 'package:hive/hive.dart';
import 'package:sketch/core/data_source/model.dart';

import 'follower.dart';
import 'following.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 4)
class ProfileModel extends BaseModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? imageUrl;

  @HiveField(4)
  List<Follower>? followers;

  @HiveField(5)
  List<Following>? following;

  @HiveField(6)
  String? role;
  @HiveField(7)
  String? coverImageUrl;

  ProfileModel({
    this.id,
    this.email,
    this.name,
    this.imageUrl,
    this.coverImageUrl,
    this.followers,
    this.following,
    this.role,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as int?,
        name: json['userName'] as String?,
        email: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        coverImageUrl: json['coverImageUrl'] as String?,
        followers: (json['followers'] as List<dynamic>?)
            ?.map((e) => Follower.fromJson(e as Map<String, dynamic>))
            .toList(),
        following: (json['following'] as List<dynamic>?)
            ?.map((e) => Following.fromJson(e as Map<String, dynamic>))
            .toList(),
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': email,
        'imageUrl': imageUrl,
        'coverImageUrl': coverImageUrl,
        'followers': followers?.map((e) => e.toJson()).toList(),
        'following': following?.map((e) => e.toJson()).toList(),
        'role': role,
      };
}
