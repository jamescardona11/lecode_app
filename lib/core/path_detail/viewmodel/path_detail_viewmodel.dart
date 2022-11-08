import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/path_detail/model/use_cases/use_cases.dart';

import 'path_detail_state.dart';

class PathDetailViewModel extends BaseViewModel<PathDetailState> {
  PathDetailViewModel(this.useCases) : super(const PathDetailState());

  final PathDetailUseCases useCases;

  Future<void> markProblemAsRead(String id) async {
    await useCases.markAsComplete.call(MarkAsCompleteParam(id));
  }
}
