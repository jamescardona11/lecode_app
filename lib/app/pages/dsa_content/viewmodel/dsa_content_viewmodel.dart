import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

import 'dsa_content_state.dart';

class DsaContentViewModel extends BaseViewModel<DsaContentState> {
  DsaContentViewModel(this.useCases) : super(const DsaContentState());

  final DsaContentUseCasesFacade useCases;

  Future<void> markProblemAsRead(String id) async {
    await useCases.markAsComplete.call(MarkAsCompleteData(id));
  }
}
