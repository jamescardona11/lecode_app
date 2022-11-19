import 'package:intl/intl.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class ReadStatsData implements CommandData {}

class ReadStatsUseCase
    implements StreamQueryUseCase<StatsModel, ReadStatsData> {
  ReadStatsUseCase(
    this.crossDsaFacade,
    this.repository,
  );

  final DsaRepository repository;
  final CrossDsaFacade crossDsaFacade;

  @override
  Stream<StatsModel> call(ReadStatsData data) =>
      crossDsaFacade.readAllDsaExercises
          .call(const ReadAllDsaExercisesData())
          .map((items) => getStatsModel(items));

  StatsModel getStatsModel(Iterable<DsaExerciseModel> items) {
    final now = _nowDate();
    int solved = 0;
    double averageAcceptanceRate = 0;
    double averageRate = 0;

    final difficulty = <String, int>{};
    final difficultySolved = <String, int>{};

    final groups = <String, int>{};
    final groupsSolved = <String, int>{};

    final topics = <String, int>{};
    final topicsSolved = <String, int>{};

    // today, 1d-b, 2d-b, 3d-b, 4d-b, 5d-b, 6d-b, 7d-b
    List<int> daysBefore = [0, 0, 0, 0, 0, 0, 0, 0];
    final daysBeforeLabel = _updateDaysBeforeLabel(now);
    int last30Days = 0;

    for (var item in items) {
      // All stats
      _getDifficulty(difficulty, item);
      _getGroups(groups, item);
      _getTopics(topics, item);

      // solved stats
      if (item.solvedDate != null) {
        solved++;
        averageAcceptanceRate += item.acceptanceRate;
        averageRate += item.myRate;
        if (_isSolvedInLast30Days(item.solvedDate!, now)) last30Days++;
        _statsForSolved(
          item,
          difficultySolved,
          groupsSolved,
          topicsSolved,
          daysBefore,
          now,
        );
      }
    }

    return StatsModel(
      daysStats: daysBefore,
      daysLabel: daysBeforeLabel,
      last30Days: last30Days,
      difficulty: difficulty,
      difficultySolved: difficultySolved,
      groups: groups,
      groupsSolved: groupsSolved,
      topics: topics,
      topicsSolved: topicsSolved,
      total: items.length,
      solved: solved,
      averageRate: averageRate / (solved == 0 ? 1 : solved),
      averageAcceptanceRate: averageAcceptanceRate / (solved == 0 ? 1 : solved),
    );
  }

  void _statsForSolved(
    DsaExerciseModel item,
    Map<String, int> difficultyCompleted,
    Map<String, int> groupsCompleted,
    Map<String, int> topicsCompleted,
    List<int> daysBefore,
    DateTime now,
  ) {
    _getDifficulty(difficultyCompleted, item);
    _getGroups(groupsCompleted, item);
    _getTopics(topicsCompleted, item);

    _updateDaysBefore(daysBefore, now, item.solvedDate!);
  }

  void _getDifficulty(Map<String, int> map, DsaExerciseModel item) {
    if (item.isEasy) _countMap('Easy', map);
    if (item.isMedium) _countMap('Medium', map);
    if (item.isHard) _countMap('Hard', map);
  }

  void _getGroups(Map<String, int> map, DsaExerciseModel item) {
    if (item.isBlind75) _countMap('Blind75', map);
    if (item.isGrind75) _countMap('Grind75', map);
    if (item.isLeetCode60) _countMap('LeetCode60', map);
    if (item.isTopInterview) _countMap('Top Interview', map);
    if (item.isTopLiked) _countMap('Top Liked', map);
    if (item.isAlgo) _countMap('Curated Algo', map);
    if (item.isOther) _countMap('Other', map);
  }

  void _getTopics(Map<String, int> map, DsaExerciseModel item) {
    for (var element in item.topics) {
      map[element] = (map[element] ?? 0) + 1;
    }
  }

  void _updateDaysBefore(
    List<int> daysBefore,
    DateTime now,
    DateTime solvedDate,
  ) {
    // today, 1d-b, 2d-b, 3d-b, 4d-b, 5d-b, 6d-b, 7d-b
    if (_matchTime(solvedDate, now, 0)) daysBefore[0]++;
    if (_matchTime(solvedDate, now, 1)) daysBefore[1]++;
    if (_matchTime(solvedDate, now, 2)) daysBefore[2]++;
    if (_matchTime(solvedDate, now, 3)) daysBefore[3]++;
    if (_matchTime(solvedDate, now, 4)) daysBefore[4]++;
    if (_matchTime(solvedDate, now, 5)) daysBefore[5]++;
    if (_matchTime(solvedDate, now, 6)) daysBefore[6]++;
    if (_matchTime(solvedDate, now, 7)) daysBefore[7]++;
  }

  List<String> _updateDaysBeforeLabel(DateTime now) {
    // today, 1d-b, 2d-b, 3d-b, 4d-b, 5d-b, 6d-b, 7d-b
    List<String> daysBeforeLabel = [
      'Today',
      _dayLabel(now, 1),
      _dayLabel(now, 2),
      _dayLabel(now, 3),
      _dayLabel(now, 4),
      _dayLabel(now, 5),
      _dayLabel(now, 6),
      _dayLabel(now, 7),
    ];

    return daysBeforeLabel;
  }

  void _countMap(String key, Map<String, int> map) {
    map[key] = (map[key] ?? 0) + 1;
  }

  DateTime _nowDate() {
    final dateTime = DateTime.now();
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  bool _isSolvedInLast30Days(
    DateTime solvedDate,
    DateTime now,
  ) {
    return solvedDate.isAfter(now.subtract(const Duration(days: 30)));
  }

  bool _matchTime(
    DateTime solvedDate,
    DateTime now,
    int daysBefore,
  ) {
    return solvedDate == now.subtract(Duration(days: daysBefore));
  }

  String _dayLabel(DateTime now, int daysBefore) {
    final date = now.subtract(Duration(days: daysBefore));
    return DateFormat('EEEE').format(date);
  }
}
