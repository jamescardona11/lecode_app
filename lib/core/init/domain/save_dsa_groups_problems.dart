import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class SaveDsaGroupsProblemsData implements CommandData {
  DsaContentProblemsAggregateDto dsaProblemsAggregate;

  SaveDsaGroupsProblemsData(this.dsaProblemsAggregate);
}

class SaveDsaGroupsProblems
    implements FutureCommandUseCase<SaveDsaGroupsProblemsData> {
  final AppRepository _repository;

  SaveDsaGroupsProblems(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaGroupsProblemsData data) =>
      _repository.saveDsaGroupsProblems(data.dsaProblemsAggregate);
}
