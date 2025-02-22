import 'package:sketch/core/data_source/model.dart';

import 'bid_dto.dart';

class ListUserProposedProjectModel extends BaseModel {
  List<UserProposedProjectModel>? data;
  ListUserProposedProjectModel({this.data});
  factory ListUserProposedProjectModel.fromJson(Map<String, dynamic> json) =>
      ListUserProposedProjectModel(
          data: json["data"] == []
              ? []
              : List<UserProposedProjectModel>.from(json["data"]!
                  .map((x) => UserProposedProjectModel.fromJson(x))));
}

class UserProposedProjectModel extends BaseModel {
  int? id;
  int? architectId;
  String? title;
  dynamic description;
  String? userName;
  List<dynamic>? projectImage;
  dynamic budget;
  dynamic deadLine;
  List<BidDto>? bidDtos;
  dynamic status;
  num? publishedSince;

  UserProposedProjectModel({
    this.id,
    this.architectId,
    this.title,
    this.description,
    this.userName,
    this.projectImage,
    this.budget,
    this.deadLine,
    this.bidDtos,
    this.status,
    this.publishedSince,
  });

  factory UserProposedProjectModel.fromJson(Map<String, dynamic> json) {
    return UserProposedProjectModel(
      id: json['id'] as int?,
      architectId: json['architectId'] as int?,
      title: json['title'] as String?,
      description: json['description'] as dynamic,
      userName: json['userName'] as String?,
      projectImage: json['projectImage'] as List<dynamic>?,
      budget: json['budget'] as dynamic,
      deadLine: json['deadline'] as dynamic,
      bidDtos: (json['bidDtos'] as List<dynamic>?)
          ?.map((e) => BidDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as dynamic,
      publishedSince: json['publishedSince'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'architectId': architectId,
        'title': title,
        'description': description,
        'userName': userName,
        'projectImage': projectImage,
        'budget': budget,
        'deadLine': deadLine,
        'bidDtos': bidDtos?.map((e) => e.toJson()).toList(),
        'status': status,
        'publishedSince': publishedSince,
      };
}
