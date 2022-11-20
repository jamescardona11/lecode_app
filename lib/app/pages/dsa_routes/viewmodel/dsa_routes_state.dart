// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class DsaRoutesState extends BaseState {
  const DsaRoutesState({
    this.routes = const [],
  });

  final List<DsaRouteProblemsModel> routes;

  @override
  List<Object?> get props => [
        routes,
      ];

  DsaRoutesState copyWith({
    List<DsaRouteProblemsModel>? routes,
  }) {
    return DsaRoutesState(
      routes: routes ?? this.routes,
    );
  }
}
