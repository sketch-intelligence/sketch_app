// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sketch/features/home/presentation/data/models/person_model.dart';

class ShareModel {
  final PersonModel shareOwner;
  ShareModel({
    required this.shareOwner,
  });

  ShareModel copyWith({
    PersonModel? shareOwner,
  }) {
    return ShareModel(
      shareOwner: shareOwner ?? this.shareOwner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shareOwner': shareOwner.toMap(),
    };
  }

  factory ShareModel.fromMap(Map<String, dynamic> map) {
    return ShareModel(
      shareOwner:
          PersonModel.fromMap(map['shareOwner'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShareModel.fromJson(String source) =>
      ShareModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShareModel(shareOwner: $shareOwner)';

  @override
  bool operator ==(covariant ShareModel other) {
    if (identical(this, other)) return true;

    return other.shareOwner == shareOwner;
  }

  @override
  int get hashCode => shareOwner.hashCode;
}
