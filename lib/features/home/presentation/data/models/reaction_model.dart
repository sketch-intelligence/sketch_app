// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sketch/features/home/presentation/data/models/person_model.dart';

class ReactionModel {
  final PersonModel reactedOwner;
  final String reactionType;
  ReactionModel({
    required this.reactedOwner,
    required this.reactionType,
  });

  ReactionModel copyWith({
    PersonModel? reactedOwner,
    String? reactionType,
  }) {
    return ReactionModel(
      reactedOwner: reactedOwner ?? this.reactedOwner,
      reactionType: reactionType ?? this.reactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reactedOwner': reactedOwner.toMap(),
      'reactionType': reactionType,
    };
  }

  factory ReactionModel.fromMap(Map<String, dynamic> map) {
    return ReactionModel(
      reactedOwner:
          PersonModel.fromMap(map['reactedOwner'] as Map<String, dynamic>),
      reactionType: map['reactionType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReactionModel.fromJson(String source) =>
      ReactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReactionModel(reactedOwner: $reactedOwner, reactionType: $reactionType)';

  @override
  bool operator ==(covariant ReactionModel other) {
    if (identical(this, other)) return true;

    return other.reactedOwner == reactedOwner &&
        other.reactionType == reactionType;
  }

  @override
  int get hashCode => reactedOwner.hashCode ^ reactionType.hashCode;
}
