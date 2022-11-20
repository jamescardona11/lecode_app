// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaSolvedListState extends BaseState {
  const DsaSolvedListState({
    this.items = const [],
  });

  final Iterable<DsaProblemModel> items;

  @override
  List<Object?> get props => [
        items,
      ];

  DsaSolvedListState copyWith({
    int? itemsPagination,
    Iterable<DsaProblemModel>? items,
    bool? showFilterList,
  }) {
    return DsaSolvedListState(
      items: items ?? this.items,
    );
  }
}
