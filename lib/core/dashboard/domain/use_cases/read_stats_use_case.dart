import 'package:intl/intl.dart';
import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class ReadStatsData implements CommandData {}

class ReadStatsUseCase
    implements StreamQueryUseCase<StatsModel, ReadStatsData> {
  ReadStatsUseCase(
    this.readAllDsaProblems,
    this.repository,
  );

  final DsaRepository repository;
  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>
      readAllDsaProblems;

  @override
  Stream<StatsModel> call(ReadStatsData data) => readAllDsaProblems
      .call(const ReadAllDsaProblemsData())
      .map((items) => getStatsModel(items));

  StatsModel getStatsModel(Iterable<DsaProblemModel> items) {
    final now = _nowDate();
    int solved = 0;
    double averageAcceptanceRate = 0;
    double averageRate = 0;

    final difficulty = <String, int>{};
    final difficultySolved = <String, int>{};

    final routes = <String, int>{};
    final routesSolved = <String, int>{};

    final topics = <String, int>{};
    final topicsSolved = <String, int>{};

    // today, 1d-b, 2d-b, 3d-b, 4d-b, 5d-b, 6d-b, 7d-b
    List<int> daysBefore = [0, 0, 0, 0, 0, 0, 0, 0];
    final daysBeforeLabel = _updateDaysBeforeLabel(now);
    int last30Days = 0;

    for (var item in items) {
      // All stats
      _getDifficulty(difficulty, item);
      _getRoutes(routes, item);
      _getTopics(topics, item);

      // solved stats
      if (item.isSolved) {
        solved++;
        averageAcceptanceRate += item.acceptanceRate;
        averageRate += item.myRate;
        if (_isSolvedInLast30Days(item.solvedDate!, now)) last30Days++;
        _statsForSolved(
          item,
          difficultySolved,
          routesSolved,
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
      routes: routes,
      routesSolved: routesSolved,
      topics: topics,
      topicsSolved: topicsSolved,
      total: items.length,
      solved: solved,
      averageRate: averageRate / (solved == 0 ? 1 : solved),
      averageAcceptanceRate: averageAcceptanceRate / (solved == 0 ? 1 : solved),
    );
  }

  void _statsForSolved(
    DsaProblemModel item,
    Map<String, int> difficultyCompleted,
    Map<String, int> routesSolved,
    Map<String, int> topicsCompleted,
    List<int> daysBefore,
    DateTime now,
  ) {
    _getDifficulty(difficultyCompleted, item);
    _getRoutes(routesSolved, item);
    _getTopics(topicsCompleted, item);

    _updateDaysBefore(daysBefore, now, item.solvedDate!);
  }

  void _getDifficulty(Map<String, int> map, DsaProblemModel item) {
    if (item.isEasy) _countMap('Easy', map);
    if (item.isMedium) _countMap('Medium', map);
    if (item.isHard) _countMap('Hard', map);
  }

  void _getRoutes(Map<String, int> map, DsaProblemModel item) {
    if (item.isBlind75) _countMap('Blind75', map);
    if (item.isGrind75) _countMap('Grind75', map);
    if (item.isSixtyBasic) _countMap('Sixty Basic', map);
    if (item.isTopInterview) _countMap('Top Interview', map);
    if (item.isTopLiked) _countMap('Top Liked', map);
    if (item.isAlgo) _countMap('Curated Algo', map);
    if (item.isOther) _countMap('Other', map);
  }

  void _getTopics(Map<String, int> map, DsaProblemModel item) {
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
