import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DashboardState extends BaseState {
  const DashboardState({
    this.statsModel = const StatsModel(),
    this.similarProblems = const [],
    this.randomProblems,
  });

  final StatsModel statsModel;
  final Iterable<DsaProblemModel> similarProblems;
  final DsaProblemModel? randomProblems;

  @override
  List<Object?> get props => [statsModel];

  DashboardState copyWith({
    StatsModel? statsModel,
    Iterable<DsaProblemModel>? similarProblems,
    DsaProblemModel? randomProblems,
  }) {
    return DashboardState(
      statsModel: statsModel ?? this.statsModel,
      similarProblems: similarProblems ?? this.similarProblems,
      randomProblems: randomProblems ?? this.randomProblems,
    );
  }

  @override
  bool operator ==(covariant DashboardState other) {
    if (identical(this, other)) return true;

    return other.statsModel == statsModel &&
        other.similarProblems == similarProblems &&
        other.randomProblems == randomProblems;
  }

  @override
  int get hashCode =>
      statsModel.hashCode ^ similarProblems.hashCode ^ randomProblems.hashCode;
}
