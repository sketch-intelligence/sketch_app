// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonModel {
  final String userName;
  final String? image;
  PersonModel({
    required this.userName,
    this.image,
  });

  PersonModel copyWith({
    String? userName,
    String? image,
  }) {
    return PersonModel(
      userName: userName ?? this.userName,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'image': image,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      userName: map['userName'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PersonModel(userName: $userName, image: $image)';

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName && other.image == image;
  }

  @override
  int get hashCode => userName.hashCode ^ image.hashCode;
}
