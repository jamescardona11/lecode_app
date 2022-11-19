import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

import 'dsa_content_state.dart';

class DsaContentViewModel extends BaseViewModel<DsaContentState> {
  DsaContentViewModel(this.useCases) : super(const DsaContentState());

  final DsaUseCasesFacade useCases;

  Future<void> markProblemAsRead(String id) async {
    await useCases.markAsSolved.call(MarkAsSolvedData(id));
  }
}
