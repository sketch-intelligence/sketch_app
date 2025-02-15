// import 'dart:convert';

// import 'package:sketch/core/data_source/model.dart';
// import 'package:sketch/features/home/data/models/person_model/person_model.dart';

// class ProfileModel extends BaseModel {
//   final String? userName;
//   final String? coverImage; // Made optional (nullable)
//   final String? profileImage; // Made optional (nullable)
//   final String bio;
//   final int followersCount;
//   final int followingCount;
//   final bool isConnected;
//   final bool isOwner;

//   ProfileModel({
//     required this.person,
//     this.coverImage, // Optional field
//     this.profileImage, // Optional field
//     required this.bio,
//     this.followersCount = 0,
//     this.followingCount = 0,
//     this.isConnected = false,
//     this.isOwner = false,
//   });

//   ProfileModel copyWith({
//     PersonModel? person,
//     String? bio,
//     String? coverImage,
//     String? profileImage,
//     int? followersCount,
//     int? followingCount,
//     bool? isConnected,
//     bool? isOwner,
//   }) {
//     return ProfileModel(
//       person: person ?? this.person,
//       bio: bio ?? this.bio,
//       coverImage: coverImage ?? this.coverImage,
//       profileImage: profileImage ?? this.profileImage,
//       followersCount: followersCount ?? this.followersCount,
//       followingCount: followingCount ?? this.followingCount,
//       isConnected: isConnected ?? this.isConnected,
//       isOwner: isOwner ?? this.isOwner,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'person': person.toJson(),
//       'coverImage': coverImage, // Nullable field
//       'profileImage': profileImage, // Nullable field
//       'bio': bio,
//       'followersCount': followersCount,
//       'followingCount': followingCount,
//       'isConnected': isConnected,
//       'isOwner': isOwner,
//     };
//   }

//   factory ProfileModel.fromMap(Map<String, dynamic> map) {
//     return ProfileModel(
//       person: PersonModel.fromJson(map['person']),
//       coverImage: map['coverImage'], // Nullable field
//       profileImage: map['profileImage'], // Nullable field
//       bio: map['bio'],
//       followersCount: map['followersCount'] ?? 0,
//       followingCount: map['followingCount'] ?? 0,
//       isConnected: map['isConnected'] ?? false,
//       isOwner: map['isOwner'] ?? false,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProfileModel.fromJson(String source) =>
//       ProfileModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'ProfileModel(person: $person, coverImage: $coverImage, profileImage: $profileImage, bio: $bio, followersCount: $followersCount, followingCount: $followingCount, isConnected: $isConnected, isOwner: $isOwner)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ProfileModel &&
//         other.person == person &&
//         other.coverImage == coverImage &&
//         other.profileImage == profileImage &&
//         other.bio == bio &&
//         other.followersCount == followersCount &&
//         other.followingCount == followingCount &&
//         other.isConnected == isConnected &&
//         other.isOwner == isOwner;
//   }

//   @override
//   int get hashCode {
//     return person.hashCode ^
//         coverImage.hashCode ^
//         profileImage.hashCode ^
//         bio.hashCode ^
//         followersCount.hashCode ^
//         followingCount.hashCode ^
//         isConnected.hashCode ^
//         isOwner.hashCode;
//   }
// }
