class BidDto {
  int? id;
  dynamic projectId;
  int? price;
  int? expectedDuration;
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
        price: json['price'] as int?,
        expectedDuration: json['expectedDuration'] as int?,
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
