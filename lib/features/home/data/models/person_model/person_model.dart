import 'authority.dart';
import 'profile_image.dart';
import 'role.dart';

class PersonModel {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Role>? roles;
  ProfileImage? profileImage;
  bool? enabled;
  bool? accountNonExpired;
  String? username;
  List<Authority>? authorities;
  bool? credentialsNonExpired;
  bool? accountNonLocked;

  PersonModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.roles,
    this.profileImage,
    this.enabled,
    this.accountNonExpired,
    this.username,
    this.authorities,
    this.credentialsNonExpired,
    this.accountNonLocked,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
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
        enabled: json['enabled'] as bool?,
        accountNonExpired: json['accountNonExpired'] as bool?,
        username: json['username'] as String?,
        authorities: (json['authorities'] as List<dynamic>?)
            ?.map((e) => Authority.fromJson(e as Map<String, dynamic>))
            .toList(),
        credentialsNonExpired: json['credentialsNonExpired'] as bool?,
        accountNonLocked: json['accountNonLocked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'roles': roles?.map((e) => e.toJson()).toList(),
        'profileImage': profileImage?.toJson(),
        'enabled': enabled,
        'accountNonExpired': accountNonExpired,
        'username': username,
        'authorities': authorities?.map((e) => e.toJson()).toList(),
        'credentialsNonExpired': credentialsNonExpired,
        'accountNonLocked': accountNonLocked,
      };
}
