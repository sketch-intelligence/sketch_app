// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomTokenModel {
  String? token;
  CustomTokenModel({
    this.token,
  });

  CustomTokenModel copyWith({
    String? token,
  }) {
    return CustomTokenModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory CustomTokenModel.fromMap(Map<String, dynamic> map) {
    return CustomTokenModel(
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomTokenModel.fromJson(String source) =>
      CustomTokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomTokenModel(token: $token)';

  @override
  bool operator ==(covariant CustomTokenModel other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
