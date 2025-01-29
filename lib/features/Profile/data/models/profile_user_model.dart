import 'dart:convert';
import 'package:sketch/features/home/data/models/person_model.dart';

class ProfileModel {
  final PersonModel person;
  final String bio;
  final int followersCount;
  final int followingCount;
  final bool isConnected;
  final bool
      isOwner; // Indicates whether the profile belongs to the logged-in user

  ProfileModel({
    required this.person,
    required this.bio,
    this.followersCount = 0,
    this.followingCount = 0,
    this.isConnected = false,
    this.isOwner = false, // Default to false
  });

  ProfileModel copyWith({
    PersonModel? person,
    String? bio,
    int? followersCount,
    int? followingCount,
    bool? isConnected,
    bool? isOwner, // Added isOwner to copyWith
  }) {
    return ProfileModel(
      person: person ?? this.person,
      bio: bio ?? this.bio,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      isConnected: isConnected ?? this.isConnected,
      isOwner: isOwner ?? this.isOwner, // Preserve isOwner value
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'person': person.toMap(),
      'bio': bio,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'isConnected': isConnected,
      'isOwner': isOwner, // Added to map conversion
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      person: PersonModel.fromMap(map['person']),
      bio: map['bio'],
      followersCount: map['followersCount'] ?? 0,
      followingCount: map['followingCount'] ?? 0,
      isConnected: map['isConnected'] ?? false,
      isOwner: map['isOwner'] ?? false, // Read from map, default to false
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileModel(person: $person, bio: $bio, followersCount: $followersCount, followingCount: $followingCount, isConnected: $isConnected, isOwner: $isOwner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.person == person &&
        other.bio == bio &&
        other.followersCount == followersCount &&
        other.followingCount == followingCount &&
        other.isConnected == isConnected &&
        other.isOwner == isOwner; // Compare isOwner
  }

  @override
  int get hashCode {
    return person.hashCode ^
        bio.hashCode ^
        followersCount.hashCode ^
        followingCount.hashCode ^
        isConnected.hashCode ^
        isOwner.hashCode; // Include isOwner in hashCode
  }
}
