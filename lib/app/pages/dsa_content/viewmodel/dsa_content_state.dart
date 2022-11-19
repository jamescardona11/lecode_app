// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaContentState extends BaseState {
  const DsaContentState({
    this.groups = const [],
  });

  final List<DsaGroupsProblemsModel> groups;

  @override
  List<Object?> get props => [
        groups,
      ];

  DsaContentState copyWith({
    List<DsaGroupsProblemsModel>? groups,
  }) {
    return DsaContentState(
      groups: groups ?? this.groups,
    );
  }
}
