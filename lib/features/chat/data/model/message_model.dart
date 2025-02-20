// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;
  bool? isRead;

  MessageModel(
      {required this.senderId,
      required this.receiverId,
      required this.text,
      required this.timestamp,
      this.isRead = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isRead': isRead
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      text: map['text'] as String,
      isRead: map['isRead'] as bool,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  MessageModel copyWith({
    String? senderId,
    String? receiverId,
    String? text,
    DateTime? timestamp,
  }) {
    return MessageModel(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(senderId: $senderId, receiverId: $receiverId, text: $text, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.text == text &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        receiverId.hashCode ^
        text.hashCode ^
        timestamp.hashCode;
  }
}
