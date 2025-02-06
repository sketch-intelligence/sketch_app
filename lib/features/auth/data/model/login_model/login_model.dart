import 'package:hive/hive.dart';
import 'package:sketch/core/data_source/model.dart';

import 'user.dart';

part 'login_model.g.dart'; // Required for Hive TypeAdapter generation

@HiveType(typeId: 0) // Unique type ID for Hive
class LoginModel extends BaseModel {
  @HiveField(0)
  String? token;

  @HiveField(1)
  int? expiresAt;

  @HiveField(2)
  User? user;

  LoginModel({this.token, this.expiresAt, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'] as String?,
        expiresAt: json['expiresAt'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'expiresAt': expiresAt,
        'user': user?.toJson(),
      };
}
