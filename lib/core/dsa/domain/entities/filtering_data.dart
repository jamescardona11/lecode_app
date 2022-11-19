import 'package:flutter/foundation.dart';

class FilteringData {
  const FilteringData({
    this.topics = const [],
    this.difficulty = const [],
    this.groupBy = '',
  });

  final List<String> topics;
  final List<String> difficulty;
  final String groupBy;

  bool get isTopicsEmpty => topics.isEmpty;
  bool get isDifficultyEmpty => difficulty.isEmpty;
  bool get byAnyDifficulty => isDifficultyEmpty || difficulty.length == 3;

  @override
  bool operator ==(covariant FilteringData other) {
    if (identical(this, other)) return true;

    return listEquals(other.topics, topics) &&
        listEquals(other.difficulty, difficulty) &&
        other.groupBy == groupBy;
  }

  @override
  int get hashCode => topics.hashCode ^ difficulty.hashCode ^ groupBy.hashCode;
}
