import 'package:sketch/core/data_source/model.dart';

import 'follower.dart';
import 'following.dart';

class ProfileModel extends BaseModel {
  int? id;
  String? name;
  String? imageUrl;
  List<Follower>? followers;
  List<Following>? following;

  ProfileModel({
    this.id,
    this.name,
    this.imageUrl,
    this.followers,
    this.following,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        followers: (json['followers'] as List<dynamic>?)
            ?.map((e) => Follower.fromJson(e as Map<String, dynamic>))
            .toList(),
        following: (json['following'] as List<dynamic>?)
            ?.map((e) => Following.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'followers': followers?.map((e) => e.toJson()).toList(),
        'following': following?.map((e) => e.toJson()).toList(),
      };
}
