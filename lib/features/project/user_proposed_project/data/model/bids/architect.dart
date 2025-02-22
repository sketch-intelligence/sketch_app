import 'authority.dart';
import 'role.dart';

class Architect {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Role>? roles;
  dynamic profileImage;
  dynamic coverImage;
  dynamic fireStoreId;
  double? balance;
  String? role;
  dynamic imageUrl;
  dynamic coverImageUrl;
  bool? enabled;
  bool? accountNonLocked;
  bool? accountNonExpired;
  bool? credentialsNonExpired;
  List<Authority>? authorities;
  String? username;

  Architect({
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
    this.accountNonLocked,
    this.accountNonExpired,
    this.credentialsNonExpired,
    this.authorities,
    this.username,
  });

  factory Architect.fromJson(Map<String, dynamic> json) => Architect(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
            .toList(),
        profileImage: json['profileImage'] as dynamic,
        coverImage: json['coverImage'] as dynamic,
        fireStoreId: json['fireStoreId'] as dynamic,
        balance: json['balance'] as double?,
        role: json['role'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
        coverImageUrl: json['coverImageUrl'] as dynamic,
        enabled: json['enabled'] as bool?,
        accountNonLocked: json['accountNonLocked'] as bool?,
        accountNonExpired: json['accountNonExpired'] as bool?,
        credentialsNonExpired: json['credentialsNonExpired'] as bool?,
        authorities: (json['authorities'] as List<dynamic>?)
            ?.map((e) => Authority.fromJson(e as Map<String, dynamic>))
            .toList(),
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'roles': roles?.map((e) => e.toJson()).toList(),
        'profileImage': profileImage,
        'coverImage': coverImage,
        'fireStoreId': fireStoreId,
        'balance': balance,
        'role': role,
        'imageUrl': imageUrl,
        'coverImageUrl': coverImageUrl,
        'enabled': enabled,
        'accountNonLocked': accountNonLocked,
        'accountNonExpired': accountNonExpired,
        'credentialsNonExpired': credentialsNonExpired,
        'authorities': authorities?.map((e) => e.toJson()).toList(),
        'username': username,
      };
}
