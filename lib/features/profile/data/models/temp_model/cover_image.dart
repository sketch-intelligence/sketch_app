class CoverImage {
  int? id;
  String? fileName;
  dynamic fileType;
  dynamic image;
  String? downloadUrl;

  CoverImage({
    this.id,
    this.fileName,
    this.fileType,
    this.image,
    this.downloadUrl,
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        id: json['id'] as int?,
        fileName: json['fileName'] as String?,
        fileType: json['fileType'] as dynamic,
        image: json['image'] as dynamic,
        downloadUrl: json['downloadUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'fileType': fileType,
        'image': image,
        'downloadUrl': downloadUrl,
      };
}
