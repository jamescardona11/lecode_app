import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class DsaListState extends BaseState {
  const DsaListState({
    this.itemsPagination = 0,
    this.items = const [],
    this.filteringData = const FilteringData(),
  });

  final int itemsPagination;
  final Iterable<DsaProblemModel> items;
  final FilteringData filteringData;

  @override
  List<Object?> get props => [
        itemsPagination,
        items,
        filteringData,
      ];

  DsaListState copyWith({
    int? itemsPagination,
    Iterable<DsaProblemModel>? items,
    FilteringData? filteringData,
  }) {
    return DsaListState(
      itemsPagination: itemsPagination ?? this.itemsPagination,
      items: items ?? this.items,
      filteringData: filteringData ?? this.filteringData,
    );
  }
}
