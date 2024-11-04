// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';
import 'package:sketch/features/home/presentation/data/models/reaction_model.dart';

class CommentModel {
  final PersonModel commentOwner;
  String? text;
  String? image;
  List<ReactionModel> reactions;
  CommentModel({
    required this.commentOwner,
    this.text,
    this.image,
    required this.reactions,
  });

  CommentModel copyWith({
    PersonModel? commentOwner,
    String? text,
    String? image,
    List<ReactionModel>? reactions,
  }) {
    return CommentModel(
      commentOwner: commentOwner ?? this.commentOwner,
      text: text ?? this.text,
      image: image ?? this.image,
      reactions: reactions ?? this.reactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentOwner': commentOwner.toMap(),
      'text': text,
      'image': image,
      'reactions': reactions.map((x) => x.toMap()).toList(),
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentOwner:
          PersonModel.fromMap(map['commentOwner'] as Map<String, dynamic>),
      text: map['text'] != null ? map['text'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      reactions: List<ReactionModel>.from(
        (map['reactions'] as List<int>).map<ReactionModel>(
          (x) => ReactionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(commentOwner: $commentOwner, text: $text, image: $image, reactions: $reactions)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.commentOwner == commentOwner &&
        other.text == text &&
        other.image == image &&
        listEquals(other.reactions, reactions);
  }

  @override
  int get hashCode {
    return commentOwner.hashCode ^
        text.hashCode ^
        image.hashCode ^
        reactions.hashCode;
  }
}
