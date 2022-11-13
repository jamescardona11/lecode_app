import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

import 'dsa_list_state.dart';

class DsaListViewModel extends BaseViewModel<DsaListState> {
  DsaListViewModel(this.useCases) : super(const DsaListState());

  final DsaUseCasesFacade useCases;

  Future<void> markProblemAsRead(String id) async {
    await useCases.markAsComplete.call(MarkAsCompleteData(id));
  }
}
