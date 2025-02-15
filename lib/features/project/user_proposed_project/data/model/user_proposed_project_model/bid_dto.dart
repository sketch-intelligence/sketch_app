class BidDto {
  int? id;
  dynamic projectId;
  num? price;
  num? expectedDuration;
  String? description;

  BidDto({
    this.id,
    this.projectId,
    this.price,
    this.expectedDuration,
    this.description,
  });

  factory BidDto.fromJson(Map<String, dynamic> json) => BidDto(
        id: json['id'] as int?,
        projectId: json['projectId'] as dynamic,
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
