import 'package:sketch/core/data_source/model.dart';
import 'package:sketch/features/profile/data/models/temp_model/temp_model.dart';

class ListBidDto extends BaseModel {
  List<BidDto>? data;
  ListBidDto({this.data});
  factory ListBidDto.fromJson(Map<String, dynamic> json) => ListBidDto(
      data: json["data"] == []
          ? []
          : List<BidDto>.from(json["data"]!.map((x) => BidDto.fromJson(x))));
}

class BidDto extends BaseModel {
  int? id;
  dynamic projectId;
  num? price;
  TempModel? arch;
  num? expectedDuration;
  String? description;

  BidDto({
    this.id,
    this.arch,
    this.projectId,
    this.price,
    this.expectedDuration,
    this.description,
  });

  factory BidDto.fromJson(Map<String, dynamic> json) => BidDto(
        id: json['id'] as int?,
        arch: json['architect'] as TempModel?,
        // projectId: json['projectId'] as dynamic,
        projectId: json['id'] as dynamic,
        price: json['price'] as num?,
        expectedDuration: json['expectedDuration'] as num?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'projectId': projectId,
        'price': price,
        'expectedDuration': expectedDuration,
        'description': description,
      };
}
