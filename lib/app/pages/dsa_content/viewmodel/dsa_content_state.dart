import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaContentState extends BaseState {
  const DsaContentState({
    this.groups = const [],
  });

  final List<DsaGroupsExercisesModel> groups;

  @override
  List<Object?> get props => [
        groups,
      ];
}
