class ProfileImage {
  int? id;
  String? fileName;
  String? fileType;
  dynamic downloadUrl;

  ProfileImage({this.id, this.fileName, this.fileType, this.downloadUrl});

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        id: json['id'] as int?,
        fileName: json['fileName'] as String?,
        fileType: json['fileType'] as String?,
        downloadUrl: json['downloadUrl'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'fileType': fileType,
        'downloadUrl': downloadUrl,
      };
}
