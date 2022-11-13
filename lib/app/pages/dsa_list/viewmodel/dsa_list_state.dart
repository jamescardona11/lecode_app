// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaListState extends BaseState {
  const DsaListState({
    this.itemsPagination = 0,
    this.items = const [],
  });

  final int itemsPagination;
  final Iterable<DsaExerciseModel> items;

  @override
  List<Object?> get props => [
        itemsPagination,
      ];

  DsaListState copyWith({
    int? itemsPagination,
    Iterable<DsaExerciseModel>? items,
  }) {
    return DsaListState(
      itemsPagination: itemsPagination ?? this.itemsPagination,
      items: items ?? this.items,
    );
  }
}
