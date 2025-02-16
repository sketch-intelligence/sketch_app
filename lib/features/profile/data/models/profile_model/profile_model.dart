import 'package:sketch/core/data_source/model.dart';

import 'follower.dart';
import 'following.dart';

class ProfileModel extends BaseModel {
  int? id;
  String? email;
  String? name;
  String? imageUrl;
  List<Follower>? followers;
  List<Following>? following;
  String? role;
  ProfileModel({
    this.id,
    this.email,
    this.name,
    this.imageUrl,
    this.followers,
    this.following,
    this.role,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as int?,
        name: json['userName'] as String?,
        email: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
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
        'followers': followers?.map((e) => e.toJson()).toList(),
        'following': following?.map((e) => e.toJson()).toList(),
        'role':role,
      };
}
