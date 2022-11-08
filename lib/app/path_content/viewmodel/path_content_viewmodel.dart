import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/app/path_content/model/use_cases/use_cases.dart';

import 'path_content_state.dart';

class PathContentViewModel extends BaseViewModel<PathContentState> {
  PathContentViewModel(this.useCases) : super(const PathContentState());

  final PathContentUseCasesFacade useCases;

  Future<void> markProblemAsRead(String id) async {
    await useCases.markAsComplete.call(MarkAsCompleteParam(id));
  }
}
