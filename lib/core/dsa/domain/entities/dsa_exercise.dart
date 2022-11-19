// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:lepath_app/core/core.dart';

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
    this.solvedDate,
  });

  final String id;
  final String name;
  final String url;
  final String difficulty;
  final List<String> topics;
  final List<GroupType> groups;
  final String notes;
  final List<String> explanation;
  final double acceptanceRate;
  final double myRate;
  final bool solved;
  final String mySolution;
  final DateTime? solvedDate;

  bool get isEasy => difficulty == 'Easy';
  bool get isMedium => difficulty == 'Medium';
  bool get isHard => difficulty == 'Hard';

  bool get isGrind75 => groups.contains(GroupType.grind75);
  bool get isBlind75 => groups.contains(GroupType.blind75);
  bool get isTopInterview => groups.contains(GroupType.topInterview);
  bool get isTopLiked => groups.contains(GroupType.topLiked);
  bool get isLeetCode60 => groups.contains(GroupType.leetCode60);
  bool get isAlgo => groups.contains(GroupType.algo);
  bool get isOther =>
      !isGrind75 &&
      !isBlind75 &&
      !isTopInterview &&
      !isTopLiked &&
      !isLeetCode60 &&
      !isAlgo;

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
        other.solvedDate == solvedDate;
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
        solvedDate.hashCode;
  }

  @override
  String toString() {
    return 'DsaExerciseModel(id: $id, name: $name, url: $url, difficulty: $difficulty, topics: $topics, groups: $groups, notes: $notes, explanation: $explanation, acceptanceRate: $acceptanceRate, myRate: $myRate, solved: $solved, mySolution: $mySolution, solvedDate: $solvedDate)';
  }
}
