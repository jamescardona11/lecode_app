import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DashboardState extends BaseState {
  const DashboardState({
    this.statsModel = const StatsModel(),
    this.similarExercises = const [],
  });

  final StatsModel statsModel;
  final Iterable<DsaExerciseModel> similarExercises;

  @override
  List<Object?> get props => [statsModel];

  DashboardState copyWith({
    StatsModel? statsModel,
    Iterable<DsaExerciseModel>? similarExercises,
  }) {
    return DashboardState(
      statsModel: statsModel ?? this.statsModel,
      similarExercises: similarExercises ?? this.similarExercises,
    );
  }
}
