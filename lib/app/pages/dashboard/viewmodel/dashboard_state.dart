// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DashboardState extends BaseState {
  const DashboardState({
    this.statsModel = const StatsModel(),
  });

  final StatsModel statsModel;

  @override
  List<Object?> get props => [statsModel];

  DashboardState copyWith({
    StatsModel? statsModel,
  }) {
    return DashboardState(
      statsModel: statsModel ?? this.statsModel,
    );
  }
}
