import 'package:sketch/core/data_source/model.dart';
import 'package:sketch/features/home/data/models/post_model/image.dart';

import 'comment.dart';
import 'owner.dart';
import 'reaction.dart';

class ListPostModelModel extends BaseModel {
  List<PostModel>? data;
  ListPostModelModel({this.data});
  factory ListPostModelModel.fromJson(Map<String, dynamic> json) =>
      ListPostModelModel(
          data: json["content"] == null
              ? []
              : List<PostModel>.from(
                  json["content"]!.map((x) => PostModel.fromJson(x))));
}

class ListUserPostModelModel extends BaseModel {
  List<PostModel>? data;
  ListUserPostModelModel({this.data});
  factory ListUserPostModelModel.fromJson(Map<String, dynamic> json) =>
      ListUserPostModelModel(
          data: json["data"] == []
              ? []
              : List<PostModel>.from(
                  json["data"]!.map((x) => PostModel.fromJson(x))));
}

class PostModel extends BaseModel {
  int? id;
  String? text;
  List<dynamic>? timeStamp;
  List<Image>? images;
  List<Comment>? comments;
  List<Reaction>? reactions;
  int? ownerId;
  Owner? owner;

  PostModel({
    this.id,
    this.text,
    this.timeStamp,
    this.images,
    this.comments,
    this.reactions,
    this.ownerId,
    this.owner,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'] as int?,
        text: json['text'] as String?,
        timeStamp: json['timeStamp'] as List<dynamic>?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        comments: (json['comments'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList(),
        reactions: (json['reactions'] as List<dynamic>?)
            ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
            .toList(),
        ownerId: json['ownerId'] as int?,
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'timeStamp': timeStamp,
        'images': images?.map((e) => e.toJson()).toList(),
        'comments': comments?.map((e) => e.toJson()).toList(),
        'reactions': reactions?.map((e) => e.toJson()).toList(),
        'ownerId': ownerId,
        'owner': owner?.toJson(),
      };
}
