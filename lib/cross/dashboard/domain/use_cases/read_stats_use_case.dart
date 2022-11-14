import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadStatsData implements CommandData {}

class ReadStatsUseCase
    implements StreamQueryUseCase<StatsModel, ReadStatsData> {
  @override
  Stream<StatsModel> call(ReadStatsData data) {
    // TODO: implement call
    throw UnimplementedError();
  }

  StatsModel getStatsModel(Iterable<DsaExerciseModel> items) {
    int completed = 0;

    int oneDaysBefore = 0;
    int twoDaysBefore = 0;
    int threeDaysBefore = 0;
    int fourDaysBefore = 0;
    int fiveDaysBefore = 0;
    int sixDaysBefore = 0;
    int sevenDaysBefore = 0;

    int last30Days = 0;

    double averageAcceptanceRate = 0;
    double averageRate = 0;

    final difficulty = {
      'Easy': 0,
      'Medium': 0,
      'Hard': 0,
    };

    final difficultyCompleted = {
      'Easy': 0,
      'Medium': 0,
      'Hard': 0,
    };

    final groups = {
      'Blind75': 0,
      'Grind75': 0,
      'Top Liked': 0,
      'LeetCode60': 0,
      'Top Interview': 0,
      'Curated Algo': 0,
      'others': 0,
    };
    final groupsCompleted = {
      'Blind75': 0,
      'Grind75': 0,
      'Top Liked': 0,
      'LeetCode60': 0,
      'Top Interview': 0,
      'Curated Algo': 0,
      'Others': 0,
    };

    final topics = <String, int>{};
    final topicsCompleted = <String, int>{};

    for (var item in items) {
      if (item.isEasy) difficulty['Easy'] = difficulty['Easy']! + 1;
      if (item.isMedium) difficulty['Medium'] = difficulty['Medium']! + 1;
      if (item.isHard) difficulty['Hard'] = difficulty['Hard']! + 1;

      if (item.isBlind75) groups['Blind75'] = groups['Blind75']! + 1;
      if (item.isGrind75) groups['Grind75'] = groups['Grind75']! + 1;
      if (item.isTopInterview) {
        groups['Top Interview'] = groups['Top Interview']! + 1;
      }
      if (item.isTopLiked) groups['Top Liked'] = groups['Top Liked']! + 1;
      if (item.isAlgo) groups['Curated Algo'] = groups['Curated Algo']! + 1;

      for (var element in item.topics) {
        topics[element] = (topicsCompleted[element] ?? 0) + 1;
      }

      if (item.completedDate != null) {
        completed++;
        averageAcceptanceRate += item.acceptanceRate;
        averageRate += item.myRate;

        if (item.isEasy) {
          difficultyCompleted['Easy'] = difficultyCompleted['Easy']! + 1;
        }
        if (item.isMedium) {
          difficultyCompleted['Medium'] = difficultyCompleted['Medium']! + 1;
        }
        if (item.isHard) {
          difficultyCompleted['Hard'] = difficultyCompleted['Hard']! + 1;
        }

        if (item.isBlind75) {
          groupsCompleted['Blind75'] = groupsCompleted['Blind75']! + 1;
        }
        if (item.isGrind75) {
          groupsCompleted['Grind75'] = groupsCompleted['Grind75']! + 1;
        }
        if (item.isTopInterview) {
          groupsCompleted['Top Interview'] =
              groupsCompleted['Top Interview']! + 1;
        }
        if (item.isTopLiked) {
          groupsCompleted['Top Liked'] = groupsCompleted['Top Liked']! + 1;
        }
        if (item.isAlgo) {
          groupsCompleted['Curated Algo'] =
              groupsCompleted['Curated Algo']! + 1;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 1))) {
          oneDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 2))) {
          twoDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 3))) {
          threeDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 4))) {
          fourDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 5))) {
          fiveDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 6))) {
          sixDaysBefore++;
        }

        if (item.completedDate ==
            DateTime.now().subtract(const Duration(days: 7))) {
          sevenDaysBefore++;
        }

        if (item.completedDate!
            .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
          last30Days++;
        }

        for (var element in item.topics) {
          topicsCompleted[element] = (topicsCompleted[element] ?? 0) + 1;
        }
      }
    }

    final others = items.length - groups.values.fold<int>(0, (p, e) => p + e);
    final othersCompleted =
        completed - groupsCompleted.values.fold<int>(0, (p, e) => p + e);

    groupsCompleted['Others'] = others;
    groups['Others'] = othersCompleted;

    return StatsModel(
      daysStats: [
        oneDaysBefore,
        twoDaysBefore,
        threeDaysBefore,
        fourDaysBefore,
        fiveDaysBefore,
        sixDaysBefore,
        sevenDaysBefore,
      ],
      last30Days: last30Days,
      difficulty: difficulty,
      difficultyCompleted: difficultyCompleted,
      groups: groups,
      groupsCompleted: groupsCompleted,
      topics: topics,
      topicsCompleted: topicsCompleted,
      total: items.length,
      completed: completed,
      averageRate: averageRate / (completed == 0 ? 1 : completed),
      averageAcceptanceRate:
          averageAcceptanceRate / (completed == 0 ? 1 : completed),
    );
  }
}
