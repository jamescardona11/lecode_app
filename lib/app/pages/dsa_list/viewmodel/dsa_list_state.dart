// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaListState extends BaseState {
  const DsaListState({
    this.itemsPagination = 0,
    this.items = const [],
    this.showFilterList = false,
  });

  final int itemsPagination;
  final Iterable<DsaExerciseModel> items;
  final bool showFilterList;

  @override
  List<Object?> get props => [
        itemsPagination,
        items,
        showFilterList,
      ];

  DsaListState copyWith({
    int? itemsPagination,
    Iterable<DsaExerciseModel>? items,
    bool? showFilterList,
  }) {
    return DsaListState(
      itemsPagination: itemsPagination ?? this.itemsPagination,
      items: items ?? this.items,
      showFilterList: showFilterList ?? this.showFilterList,
    );
  }
}
