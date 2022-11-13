// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class DsaExerciseModel {
  DsaExerciseModel({
    required this.id,
    required this.name,
    required this.url,
    required this.difficulty,
    required this.topics,
    required this.groups,
    required this.acceptanceRate,
    required this.myRate,
    required this.notes,
    required this.explanation,
    required this.solved,
    required this.mySolution,
    this.completedDate,
  });

  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<String> groups;
  final String notes;
  final List<String> explanation;
  final double acceptanceRate;
  final double myRate;
  final bool solved;
  final String mySolution;
  final DateTime? completedDate;

  @override
  bool operator ==(covariant DsaExerciseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.url == url &&
        other.difficulty == difficulty &&
        listEquals(other.topics, topics) &&
        listEquals(other.groups, groups) &&
        other.notes == notes &&
        listEquals(other.explanation, explanation) &&
        other.acceptanceRate == acceptanceRate &&
        other.myRate == myRate &&
        other.solved == solved &&
        other.mySolution == mySolution &&
        other.completedDate == completedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        url.hashCode ^
        difficulty.hashCode ^
        topics.hashCode ^
        groups.hashCode ^
        notes.hashCode ^
        explanation.hashCode ^
        acceptanceRate.hashCode ^
        myRate.hashCode ^
        solved.hashCode ^
        mySolution.hashCode ^
        completedDate.hashCode;
  }

  @override
  String toString() {
    return 'DsaExerciseModel(id: $id, name: $name, url: $url, difficulty: $difficulty, topics: $topics, groups: $groups, notes: $notes, explanation: $explanation, acceptanceRate: $acceptanceRate, myRate: $myRate, solved: $solved, mySolution: $mySolution, completedDate: $completedDate)';
  }
}
