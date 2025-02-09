class Reaction {
  int? id;
  String? reactionType;
  dynamic userId;
  dynamic postId;

  Reaction({this.id, this.reactionType, this.userId, this.postId});

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        id: json['id'] as int?,
        reactionType: json['reactionType'] as String?,
        userId: json['userId'] as dynamic,
        postId: json['postId'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'reactionType': reactionType,
        'userId': userId,
        'postId': postId,
      };
}
