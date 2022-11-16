// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant DashboardState other) {
    if (identical(this, other)) return true;

    return other.statsModel == statsModel &&
        other.similarExercises == similarExercises;
  }

  @override
  int get hashCode => statsModel.hashCode ^ similarExercises.hashCode;
}
