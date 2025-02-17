import 'package:sketch/core/data_source/model.dart';

class ListComment extends BaseModel {
  List<Comment>? data;
  ListComment({this.data});
  factory ListComment.fromJson(Map<String, dynamic> json) => ListComment(
      data: json["data"] == []
          ? []
          : List<Comment>.from(json["data"]!.map((x) => Comment.fromJson(x))));
}

class Comment extends BaseModel {
  int? id;
  String? text;

  int? postId;
  int? userId;

  Comment({this.id, this.text, this.postId, this.userId});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as int?,
        text: json['text'] as String?,
        postId: json['postId'] as int?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'postId': postId,
        'userId': userId,
      };
}
