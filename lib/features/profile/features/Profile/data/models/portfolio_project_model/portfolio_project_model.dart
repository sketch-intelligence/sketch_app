import 'package:sketch/core/data_source/model.dart';

import 'architect.dart';
import 'project_image.dart';

class ListPortfolioProjectModel extends BaseModel {
  List<PortfolioProjectModel>? data;

  ListPortfolioProjectModel({this.data});
  factory ListPortfolioProjectModel.fromJson(Map<String, dynamic> json) =>
      ListPortfolioProjectModel(
          data: json["data"] == []
              ? []
              : List<PortfolioProjectModel>.from(
                  json["data"]!.map((x) => PortfolioProjectModel.fromJson(x))));
}

class PortfolioProjectModel extends BaseModel {
  int? id;
  Architect? architect;
  String? title;
  List<ProjectImage>? projectImage;
  String? description;

  PortfolioProjectModel({
    this.id,
    this.architect,
    this.title,
    this.projectImage,
    this.description,
  });

  factory PortfolioProjectModel.fromJson(Map<String, dynamic> json) {
    return PortfolioProjectModel(
      id: json['id'] as int?,
      architect: json['architect'] == null
          ? null
          : Architect.fromJson(json['architect'] as Map<String, dynamic>),
      title: json['title'] as String?,
      projectImage: (json['projectImage'] as List<dynamic>?)
          ?.map((e) => ProjectImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'architect': architect?.toJson(),
        'title': title,
        'projectImage': projectImage?.map((e) => e.toJson()).toList(),
        'description': description,
      };
}
