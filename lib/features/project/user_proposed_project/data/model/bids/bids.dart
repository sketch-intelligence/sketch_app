import 'package:sketch/core/data_source/model.dart';

import 'architect.dart';

class ListBids extends BaseModel {
  List<Bids>? data;
  ListBids({this.data});
  factory ListBids.fromJson(Map<String, dynamic> json) => ListBids(
      data: json["data"] == []
          ? []
          : List<Bids>.from(json["data"]!.map((x) => Bids.fromJson(x))));
}

class Bids extends BaseModel {
  int? id;
  Architect? architect;
  num? price;
  num? expectedDuration;
  String? description;

  Bids({
    this.id,
    this.architect,
    this.price,
    this.expectedDuration,
    this.description,
  });

  factory Bids.fromJson(Map<String, dynamic> json) => Bids(
        id: json['id'] as int?,
        architect: json['architect'] == null
            ? null
            : Architect.fromJson(json['architect'] as Map<String, dynamic>),
        price: json['price'] as num?,
        expectedDuration: json['expectedDuration'] as num?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'architect': architect?.toJson(),
        'price': price,
        'expectedDuration': expectedDuration,
        'description': description,
      };
}
