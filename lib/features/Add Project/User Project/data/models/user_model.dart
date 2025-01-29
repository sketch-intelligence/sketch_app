import 'package:sketch/features/Profile/data/models/project_model.dart';

class UserProjectModel extends ProjectModel {
  final String feedback;

  UserProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required this.feedback,
  });

  factory UserProjectModel.fromJson(Map<String, dynamic> json) {
    return UserProjectModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      feedback: json['feedback'] ?? '',
    );
  }
}
