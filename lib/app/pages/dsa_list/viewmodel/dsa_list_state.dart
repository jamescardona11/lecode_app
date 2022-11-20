import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaListState extends BaseState {
  const DsaListState({
    this.itemsPagination = 0,
    this.items = const [],
    this.initialFilteringData = const FilteringData(),
  });

  final int itemsPagination;
  final Iterable<DsaProblemModel> items;
  final FilteringData initialFilteringData;

  @override
  List<Object?> get props => [
        itemsPagination,
        items,
        initialFilteringData,
      ];

  DsaListState copyWith({
    int? itemsPagination,
    Iterable<DsaProblemModel>? items,
    FilteringData? initialFilteringData,
  }) {
    return DsaListState(
      itemsPagination: itemsPagination ?? this.itemsPagination,
      items: items ?? this.items,
      initialFilteringData: initialFilteringData ?? this.initialFilteringData,
    );
  }
}
