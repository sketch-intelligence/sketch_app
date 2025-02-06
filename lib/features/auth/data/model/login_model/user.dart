import 'authority.dart';
import 'role.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Role>? roles;
  bool? enabled;
  bool? credentialsNonExpired;
  bool? accountNonExpired;
  bool? accountNonLocked;
  String? username;
  List<Authority>? authorities;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.roles,
    this.enabled,
    this.credentialsNonExpired,
    this.accountNonExpired,
    this.accountNonLocked,
    this.username,
    this.authorities,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
        enabled: json['enabled'] as bool?,
        credentialsNonExpired: json['credentialsNonExpired'] as bool?,
        accountNonExpired: json['accountNonExpired'] as bool?,
        accountNonLocked: json['accountNonLocked'] as bool?,
        username: json['username'] as String?,
        authorities: (json['authorities'] as List<dynamic>?)
            ?.map((e) => Authority.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'roles': roles?.map((e) => e.toJson()).toList(),
        'enabled': enabled,
        'credentialsNonExpired': credentialsNonExpired,
        'accountNonExpired': accountNonExpired,
        'accountNonLocked': accountNonLocked,
        'username': username,
        'authorities': authorities?.map((e) => e.toJson()).toList(),
      };
}
