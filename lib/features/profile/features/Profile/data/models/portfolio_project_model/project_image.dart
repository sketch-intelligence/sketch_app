class ProjectImage {
  int? id;
  String? fileName;
  String? downloadUrl;

  ProjectImage({this.id, this.fileName, this.downloadUrl});

  factory ProjectImage.fromJson(Map<String, dynamic> json) => ProjectImage(
        id: json['id'] as int?,
        fileName: json['fileName'] as String?,
        downloadUrl: json['downloadUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'downloadUrl': downloadUrl,
      };
}
