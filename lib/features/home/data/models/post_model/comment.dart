class Comment {
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
