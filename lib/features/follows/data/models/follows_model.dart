// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sketch/features/home/data/models/person_model.dart';

class FollowModel {
  final PersonModel person;
  final DateTime? dateFollowed;
  final bool? isFollowingBack;
  final bool? isMuted;
  final bool? isBlocked;

  FollowModel({
    required this.person,
    this.dateFollowed,
    this.isFollowingBack,
    this.isMuted,
    this.isBlocked,
  });

  FollowModel copyWith({
    PersonModel? person,
    DateTime? dateFollowed,
    bool? isFollowingBack,
    bool? isMuted,
    bool? isBlocked,
  }) {
    return FollowModel(
      person: person ?? this.person,
      dateFollowed: dateFollowed ?? this.dateFollowed,
      isFollowingBack: isFollowingBack ?? this.isFollowingBack,
      isMuted: isMuted ?? this.isMuted,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'person': person.toMap(),
      'dateFollowed': dateFollowed?.millisecondsSinceEpoch,
      'isFollowingBack': isFollowingBack,
      'isMuted': isMuted,
      'isBlocked': isBlocked,
    };
  }

  factory FollowModel.fromMap(Map<String, dynamic> map) {
    return FollowModel(
      person: PersonModel.fromMap(map['person'] as Map<String, dynamic>),
      dateFollowed: map['dateFollowed'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateFollowed'] as int)
          : null,
      isFollowingBack: map['isFollowingBack'] as bool?,
      isMuted: map['isMuted'] as bool?,
      isBlocked: map['isBlocked'] as bool?,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowModel.fromJson(String source) =>
      FollowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FollowModel(person: $person, dateFollowed: $dateFollowed, isFollowingBack: $isFollowingBack, isMuted: $isMuted, isBlocked: $isBlocked)';
  }

  @override
  bool operator ==(covariant FollowModel other) {
    if (identical(this, other)) return true;

    return other.person == person &&
        other.dateFollowed == dateFollowed &&
        other.isFollowingBack == isFollowingBack &&
        other.isMuted == isMuted &&
        other.isBlocked == isBlocked;
  }

  @override
  int get hashCode {
    return person.hashCode ^
        dateFollowed.hashCode ^
        isFollowingBack.hashCode ^
        isMuted.hashCode ^
        isBlocked.hashCode;
  }
}
