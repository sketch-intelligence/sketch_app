import 'package:sketch/core/data_source/model.dart';

import 'authority.dart';
import 'cover_image.dart';
import 'profile_image.dart';
import 'role.dart';

class TempModel extends BaseModel {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Role>? roles;
  ProfileImage? profileImage;
  CoverImage? coverImage;
  dynamic fireStoreId;
  num? balance;
  String? role;
  String? imageUrl;
  String? coverImageUrl;
  bool? enabled;
  bool? credentialsNonExpired;
  bool? accountNonExpired;
  String? username;
  List<Authority>? authorities;
  bool? accountNonLocked;

  TempModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.roles,
    this.profileImage,
    this.coverImage,
    this.fireStoreId,
    this.balance,
    this.role,
    this.imageUrl,
    this.coverImageUrl,
    this.enabled,
    this.credentialsNonExpired,
    this.accountNonExpired,
    this.username,
    this.authorities,
    this.accountNonLocked,
  });

  factory TempModel.fromJson(Map<String, dynamic> json) => TempModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
        profileImage: json['profileImage'] == null
            ? null
            : ProfileImage.fromJson(
                json['profileImage'] as Map<String, dynamic>),
        coverImage: json['coverImage'] == null
            ? null
            : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
        fireStoreId: json['fireStoreId'] as dynamic,
        balance: json['balance'] as num?,
        role: json['role'] as String?,
        imageUrl: json['imageUrl'] as String?,
        coverImageUrl: json['coverImageUrl'] as String?,
        enabled: json['enabled'] as bool?,
        credentialsNonExpired: json['credentialsNonExpired'] as bool?,
        accountNonExpired: json['accountNonExpired'] as bool?,
        username: json['username'] as String?,
        authorities: (json['authorities'] as List<dynamic>?)
            ?.map((e) => Authority.fromJson(e as Map<String, dynamic>))
            .toList(),
        accountNonLocked: json['accountNonLocked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'roles': roles?.map((e) => e.toJson()).toList(),
        'profileImage': profileImage?.toJson(),
        'coverImage': coverImage?.toJson(),
        'fireStoreId': fireStoreId,
        'balance': balance,
        'role': role,
        'imageUrl': imageUrl,
        'coverImageUrl': coverImageUrl,
        'enabled': enabled,
        'credentialsNonExpired': credentialsNonExpired,
        'accountNonExpired': accountNonExpired,
        'username': username,
        'authorities': authorities?.map((e) => e.toJson()).toList(),
        'accountNonLocked': accountNonLocked,
      };
}
