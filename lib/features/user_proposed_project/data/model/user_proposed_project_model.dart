// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sketch/core/data_source/model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';

enum ProjectState { Open, Closed }

class UserProposedProjectModel extends BaseModel {
  final String id;
  final String title;
  final String description;
  final String numberOfBids;
  final PersonModel author;
  final DateTime postDate;
  final String budget;
  final String duration;
  final ProjectState state;
  UserProposedProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.numberOfBids,
    required this.author,
    required this.postDate,
    required this.budget,
    required this.duration,
    required this.state,
  });

  UserProposedProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    String? numberOfBids,
    PersonModel? author,
    DateTime? postDate,
    String? budget,
    String? duration,
    ProjectState? state,
  }) {
    return UserProposedProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      numberOfBids: numberOfBids ?? this.numberOfBids,
      author: author ?? this.author,
      postDate: postDate ?? this.postDate,
      budget: budget ?? this.budget,
      duration: duration ?? this.duration,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'numberOfBids': numberOfBids,
      // 'author': author.toMap(),
      'postDate': postDate.millisecondsSinceEpoch,
      'budget': budget,
      'duration': duration,
      'state': state,
    };
  }

  factory UserProposedProjectModel.fromMap(Map<String, dynamic> map) {
    return UserProposedProjectModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      numberOfBids: map['numberOfBids'] as String,
      author: PersonModel.fromJson(map['author'] as Map<String, dynamic>),
      postDate: DateTime.fromMillisecondsSinceEpoch(map['postDate'] as int),
      budget: map['budget'] as String,
      duration: map['duration'] as String,
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProposedProjectModel.fromJson(String source) =>
      UserProposedProjectModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProposedProject(id: $id, title: $title, description: $description, numberOfBids: $numberOfBids, author: $author, postDate: $postDate, budget: $budget, duration: $duration, state: $state)';
  }

  @override
  bool operator ==(covariant UserProposedProjectModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.numberOfBids == numberOfBids &&
        other.author == author &&
        other.postDate == postDate &&
        other.budget == budget &&
        other.duration == duration &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        numberOfBids.hashCode ^
        author.hashCode ^
        postDate.hashCode ^
        budget.hashCode ^
        duration.hashCode ^
        state.hashCode;
  }
}
