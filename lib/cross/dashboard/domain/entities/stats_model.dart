import 'package:flutter/foundation.dart';

class StatsModel {
  StatsModel({
    this.last30Days = 0,
    this.daysStats = const [],
    this.difficulty = const {},
    this.difficultyCompleted = const {},
    this.groups = const {},
    this.groupsCompleted = const {},
    this.topics = const {},
    this.topicsCompleted = const {},
    this.total = 0,
    this.completed = 0,
    this.averageAcceptanceRate = 0.0,
    this.averageRate = 0.0,
  });

  final int last30Days;
  final List<int> daysStats;
  final Map<String, int> difficulty;
  final Map<String, int> difficultyCompleted;
  final Map<String, int> groups;
  final Map<String, int> groupsCompleted;
  final Map<String, int> topics;
  final Map<String, int> topicsCompleted;
  final int total;
  final int completed;
  final double averageAcceptanceRate;
  final double averageRate;

  @override
  bool operator ==(covariant StatsModel other) {
    if (identical(this, other)) return true;

    return other.last30Days == last30Days &&
        listEquals(other.daysStats, daysStats) &&
        mapEquals(other.difficulty, difficulty) &&
        mapEquals(other.difficultyCompleted, difficultyCompleted) &&
        mapEquals(other.groups, groups) &&
        mapEquals(other.groupsCompleted, groupsCompleted) &&
        mapEquals(other.topics, topics) &&
        mapEquals(other.topicsCompleted, topicsCompleted) &&
        other.total == total &&
        other.completed == completed &&
        other.averageAcceptanceRate == averageAcceptanceRate &&
        other.averageRate == averageRate;
  }

  @override
  int get hashCode {
    return last30Days.hashCode ^
        daysStats.hashCode ^
        difficulty.hashCode ^
        difficultyCompleted.hashCode ^
        groups.hashCode ^
        groupsCompleted.hashCode ^
        topics.hashCode ^
        topicsCompleted.hashCode ^
        total.hashCode ^
        completed.hashCode ^
        averageAcceptanceRate.hashCode ^
        averageRate.hashCode;
  }

  @override
  String toString() {
    return 'StatsModel(last30Days: $last30Days, daysStats: $daysStats, difficulty: $difficulty, difficultyCompleted: $difficultyCompleted, groups: $groups, groupsCompleted: $groupsCompleted, topics: $topics, topicsCompleted: $topicsCompleted, total: $total, completed: $completed, averageAcceptanceRate: $averageAcceptanceRate, averageRate: $averageRate)';
  }
}
