import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilteringData {
  const FilteringData({
    this.route = '',
    this.topics = const [],
    this.difficulty = const [],
    this.groupBy = '',
  });

  final String route;
  final List<String> topics;
  final List<String> difficulty;
  final String groupBy;

  bool get isTopicsEmpty => topics.isEmpty;
  bool get isDifficultyEmpty => difficulty.isEmpty;
  bool get byAnyDifficulty => isDifficultyEmpty || difficulty.length == 3;

  bool get isEmpty => isTopicsEmpty && isDifficultyEmpty && groupBy.isEmpty;

  @override
  String toString() {
    return 'FilteringData(route: $route, topics: $topics, difficulty: $difficulty, groupBy: $groupBy)';
  }

  @override
  bool operator ==(covariant FilteringData other) {
    if (identical(this, other)) return true;

    return other.route == route &&
        listEquals(other.topics, topics) &&
        listEquals(other.difficulty, difficulty) &&
        other.groupBy == groupBy;
  }

  @override
  int get hashCode {
    return route.hashCode ^
        topics.hashCode ^
        difficulty.hashCode ^
        groupBy.hashCode;
  }
}
