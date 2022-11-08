import 'package:lepath_app/core/base/base.dart';

import 'mark_as_completed_use_case.dart';

class PathContentUseCasesFacade {
  PathContentUseCasesFacade(this.markAsComplete);

  final FutureCommandUseCase<MarkAsCompleteParam> markAsComplete;
}
