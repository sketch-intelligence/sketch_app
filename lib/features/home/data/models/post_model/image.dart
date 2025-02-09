class Image {
  int? id;
  String? fileName;
  String? downloadUrl;

  Image({this.id, this.fileName, this.downloadUrl});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
