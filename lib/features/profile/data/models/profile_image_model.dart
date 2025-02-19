class ProfileImageModel {
  int? id;
  String? fileName;
  String? fileType;
  dynamic image;
  String? downloadUrl;

  ProfileImageModel({
    this.id,
    this.fileName,
    this.fileType,
    this.image,
    this.downloadUrl,
  });

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return ProfileImageModel(
      id: json['id'] as int?,
      fileName: json['fileName'] as String?,
      fileType: json['fileType'] as String?,
      image: json['image'] as dynamic,
      downloadUrl: json['downloadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'fileType': fileType,
        'image': image,
        'downloadUrl': downloadUrl,
      };
}
