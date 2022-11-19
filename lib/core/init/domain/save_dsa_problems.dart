import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class SaveDsaProblemData implements CommandData {
  DsaContentProblemsAggregateDto dsaProblemsAggregate;

  SaveDsaProblemData(this.dsaProblemsAggregate);
}

class SaveDsaProblem implements FutureCommandUseCase<SaveDsaProblemData> {
  final AppRepository _repository;

  SaveDsaProblem(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaProblemData data) =>
      _repository.saveDsaProblems(data.dsaProblemsAggregate);
}
