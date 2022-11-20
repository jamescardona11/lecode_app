// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:lepath_app/core/core.dart';

class DsaProblemModel {
  DsaProblemModel({
    required this.id,
    required this.name,
    required this.url,
    required this.difficulty,
    required this.topics,
    required this.routes,
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
  final List<GroupType> routes;
  final String notes;
  final List<String> explanation;
  final double acceptanceRate;
  final double myRate;
  final bool solved;
  final String mySolution;
  final DateTime? solvedDate;

  bool get isSolved => solvedDate != null;

  bool get isEasy => difficulty == 'Easy';
  bool get isMedium => difficulty == 'Medium';
  bool get isHard => difficulty == 'Hard';

  bool get isGrind75 => routes.contains(GroupType.grind75);
  bool get isBlind75 => routes.contains(GroupType.blind75);
  bool get isTopInterview => routes.contains(GroupType.topInterview);
  bool get isTopLiked => routes.contains(GroupType.topLiked);
  bool get isSixtyBasic => routes.contains(GroupType.sixtyBasic);
  bool get isAlgo => routes.contains(GroupType.algo);
  bool get isOther =>
      !isGrind75 &&
      !isBlind75 &&
      !isTopInterview &&
      !isTopLiked &&
      !isSixtyBasic &&
      !isAlgo;

  @override
  bool operator ==(covariant DsaProblemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.url == url &&
        other.difficulty == difficulty &&
        listEquals(other.topics, topics) &&
        listEquals(other.routes, routes) &&
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
        routes.hashCode ^
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
    return 'DsaProblemModel(id: $id, name: $name, url: $url, difficulty: $difficulty, topics: $topics, routes: $routes, notes: $notes, explanation: $explanation, acceptanceRate: $acceptanceRate, myRate: $myRate, solved: $solved, mySolution: $mySolution, solvedDate: $solvedDate)';
  }
}
