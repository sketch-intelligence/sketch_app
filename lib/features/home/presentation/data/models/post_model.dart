// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sketch/features/home/presentation/data/models/comment_model.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';
import 'package:sketch/features/home/presentation/data/models/reaction_model.dart';
import 'package:sketch/features/home/presentation/data/models/share_model.dart';

class PostModel {
  final String? text;
  final String? image;
  final PersonModel postOwner;
  List<CommentModel> postComments;
  List<ReactionModel> reactions;
  List<ShareModel> shares;
  bool isPublic;
  final String postDate;
  PostModel({
    this.text,
    this.image,
    required this.postOwner,
    required this.postComments,
    required this.reactions,
    required this.shares,
    required this.isPublic,
    required this.postDate,
  });

  PostModel copyWith({
    String? text,
    String? image,
    PersonModel? postOwner,
    List<CommentModel>? postComments,
    List<ReactionModel>? reactions,
    List<ShareModel>? shares,
    bool? isPublic,
    String? postDate,
  }) {
    return PostModel(
      text: text ?? this.text,
      image: image ?? this.image,
      postOwner: postOwner ?? this.postOwner,
      postComments: postComments ?? this.postComments,
      reactions: reactions ?? this.reactions,
      shares: shares ?? this.shares,
      isPublic: isPublic ?? this.isPublic,
      postDate: postDate ?? this.postDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'image': image,
      'postOwner': postOwner.toMap(),
      'postComments': postComments.map((x) => x.toMap()).toList(),
      'reactions': reactions.map((x) => x.toMap()).toList(),
      'shares': shares.map((x) => x.toMap()).toList(),
      'isPublic': isPublic,
      'postDate': postDate,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      text: map['text'] != null ? map['text'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      postOwner: PersonModel.fromMap(map['postOwner'] as Map<String, dynamic>),
      postComments: List<CommentModel>.from(
        (map['postComments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      reactions: List<ReactionModel>.from(
        (map['reactions'] as List<int>).map<ReactionModel>(
          (x) => ReactionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      shares: List<ShareModel>.from(
        (map['shares'] as List<int>).map<ShareModel>(
          (x) => ShareModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isPublic: map['isPublic'] as bool,
      postDate: map['postDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(text: $text, image: $image, postOwner: $postOwner, postComments: $postComments, reactions: $reactions, shares: $shares, isPublic: $isPublic, postDate: $postDate)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.image == image &&
        other.postOwner == postOwner &&
        listEquals(other.postComments, postComments) &&
        listEquals(other.reactions, reactions) &&
        listEquals(other.shares, shares) &&
        other.isPublic == isPublic &&
        other.postDate == postDate;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        image.hashCode ^
        postOwner.hashCode ^
        postComments.hashCode ^
        reactions.hashCode ^
        shares.hashCode ^
        isPublic.hashCode ^
        postDate.hashCode;
  }
}
