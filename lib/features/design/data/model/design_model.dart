// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:sketch/core/data_source/model.dart';

class DesignModel extends BaseModel {
  Uint8List? image;
  DesignModel({
    this.image,
  });

  DesignModel copyWith({
    Uint8List? image,
  }) {
    return DesignModel(
      image: image ?? this.image,
    );
  }

  factory DesignModel.fromMap(Uint8List map) {
    return DesignModel(
      image: map,
    );
  }
}
