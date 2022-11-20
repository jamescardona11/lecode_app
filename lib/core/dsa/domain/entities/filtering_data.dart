// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilteringData {
  const FilteringData({
    this.route = '',
    this.topics = const [],
    this.difficulty = const [],
    this.groupBy = '',
    this.onlySolved = false,
    this.onlyUnsolved = false,
  });

  final String route;
  final List<String> topics;
  final List<String> difficulty;
  final String groupBy;
  final bool onlySolved;
  final bool onlyUnsolved;

  bool get isTopicsEmpty => topics.isEmpty;
  bool get isDifficultyEmpty => difficulty.isEmpty;
  bool get byAnyDifficulty => isDifficultyEmpty || difficulty.length == 3;

  bool get isEmpty => isTopicsEmpty && isDifficultyEmpty && groupBy.isEmpty;

  @override
  String toString() {
    return 'FilteringData(route: $route, topics: $topics, difficulty: $difficulty, groupBy: $groupBy, onlySolved: $onlySolved, onlyUnsolved: $onlyUnsolved)';
  }
}
