import 'package:flutter/foundation.dart';

class StatsModel {
  const StatsModel({
    this.last30Days = 0,
    this.daysStats = const [],
    this.daysLabel = const [],
    this.difficulty = const {},
    this.difficultySolved = const {},
    this.routes = const {},
    this.routesSolved = const {},
    this.topics = const {},
    this.topicsSolved = const {},
    this.total = 0,
    this.solved = 0,
    this.averageAcceptanceRate = 0.0,
    this.averageRate = 0.0,
  });

  final int last30Days;
  final List<int> daysStats;
  final List<String> daysLabel;
  final Map<String, int> difficulty;
  final Map<String, int> difficultySolved;
  final Map<String, int> routes;
  final Map<String, int> routesSolved;
  final Map<String, int> topics;
  final Map<String, int> topicsSolved;
  final int total;
  final int solved;
  final double averageAcceptanceRate;
  final double averageRate;

  int get easy => difficulty['Easy'] ?? 0;
  int get medium => difficulty['Medium'] ?? 0;
  int get hard => difficulty['Hard'] ?? 0;

  int get easySolved => difficultySolved['Easy'] ?? 0;
  int get mediumSolved => difficultySolved['Medium'] ?? 0;
  int get hardSolved => difficultySolved['Hard'] ?? 0;

  bool get isEmpty => solved == 0;

  @override
  bool operator ==(covariant StatsModel other) {
    if (identical(this, other)) return true;

    return other.last30Days == last30Days &&
        listEquals(other.daysStats, daysStats) &&
        mapEquals(other.difficulty, difficulty) &&
        mapEquals(other.difficultySolved, difficultySolved) &&
        mapEquals(other.routes, routes) &&
        mapEquals(other.routesSolved, routesSolved) &&
        mapEquals(other.topics, topics) &&
        mapEquals(other.topicsSolved, topicsSolved) &&
        other.total == total &&
        other.solved == solved &&
        other.averageAcceptanceRate == averageAcceptanceRate &&
        other.averageRate == averageRate;
  }

  @override
  int get hashCode {
    return last30Days.hashCode ^
        daysStats.hashCode ^
        difficulty.hashCode ^
        difficultySolved.hashCode ^
        routes.hashCode ^
        routesSolved.hashCode ^
        topics.hashCode ^
        topicsSolved.hashCode ^
        total.hashCode ^
        solved.hashCode ^
        averageAcceptanceRate.hashCode ^
        averageRate.hashCode;
  }

  @override
  String toString() {
    return 'StatsModel(total: $total, solved: $solved, averageAcceptanceRate: $averageAcceptanceRate, averageRate: $averageRate, last30Days: $last30Days, daysStats: $daysStats, daysLabel: $daysLabel, difficulty: $difficulty, difficultySolved: $difficultySolved, routes: $routes, routesSolved: $routesSolved, topics: $topics, topicsSolved: $topicsSolved)';
  }
}
