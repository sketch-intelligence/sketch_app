import 'package:sketch/features/Profile/data/models/project_model.dart';

class ArchitectProjectModel extends ProjectModel {
  final List<String> completionDate;

  ArchitectProjectModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required this.completionDate,
  });

  factory ArchitectProjectModel.fromJson(Map<String, dynamic> json) {
    return ArchitectProjectModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      completionDate: json['completionDate'] ?? '',
    );
  }
}
