// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sketch/features/home/presentation/data/models/person_model.dart';
import 'package:sketch/features/notification/data/model/notification_type.dart';

class NotificationModel {
  final PersonModel person;
  final String message;
  final String? description;
  final DateTime date;
  final NotificationType type;
  final bool isRead;
  NotificationModel({
    required this.person,
    required this.message,
    this.description,
    required this.date,
    required this.type,
    required this.isRead,
  });

  NotificationModel copyWith({
    PersonModel? person,
    String? message,
    String? description,
    DateTime? date,
    NotificationType? type,
    bool? isRead,
  }) {
    return NotificationModel(
      person: person ?? this.person,
      message: message ?? this.message,
      description: description ?? this.description,
      date: date ?? this.date,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'person': person.toMap(),
      'message': message,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'type': type,
      'isRead': isRead,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      person: PersonModel.fromMap(map['person'] as Map<String, dynamic>),
      message: map['message'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      type: map['type'] as NotificationType,
      isRead: map['isRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(person: $person, message: $message, description: $description, date: $date, type: $type, isRead: $isRead)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.person == person &&
        other.message == message &&
        other.description == description &&
        other.date == date &&
        other.type == type &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    return person.hashCode ^
        message.hashCode ^
        description.hashCode ^
        date.hashCode ^
        type.hashCode ^
        isRead.hashCode;
  }
}
