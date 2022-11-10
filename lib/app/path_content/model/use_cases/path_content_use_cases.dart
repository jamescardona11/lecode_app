import 'package:lepath_app/core/base/base.dart';

import 'use_cases.dart';

class PathContentUseCasesFacade {
  PathContentUseCasesFacade(
    this.markAsComplete,
    this.fetchAllPathContent,
    this.saveAllPathContentData,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final FutureCommandUseCase<SaveAllPathContentData> saveAllPathContentData;

  final QueryUseCasePathItems fetchAllPathContent;
}
