// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/data_source/model.dart';

class ListSimilarDesign extends BaseModel {
  List<SimilarDesgin>? data;
  ListSimilarDesign({this.data});
  factory ListSimilarDesign.fromJson(Map<String, dynamic> json) =>
      ListSimilarDesign(
          data: json["similar_images"] == null
              ? []
              : List<SimilarDesgin>.from(json["similar_images"]!
                  .map((x) => SimilarDesgin.fromJson(x))));
}

class SimilarDesgin extends BaseModel {
  String? imageName;
  double? similarityScore;
  String? imageUrl;

  SimilarDesgin({this.imageName, this.similarityScore, this.imageUrl});

  factory SimilarDesgin.fromJson(Map<String, dynamic> json) => SimilarDesgin(
        imageName: json['image_name'] as String?,
        similarityScore: (json['similarity_score'] as num?)?.toDouble(),
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image_name': imageName,
        'similarity_score': similarityScore,
        'image_url': imageUrl,
      };
}
