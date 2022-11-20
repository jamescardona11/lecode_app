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
}
