import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/core/core.dart';

class SaveDsaProblemsData implements CommandData {
  DsaProblemsDto dsaProblems;

  SaveDsaProblemsData(this.dsaProblems);
}

class SaveDsaProblems implements FutureCommandUseCase<SaveDsaProblemsData> {
  final AppRepository _repository;

  SaveDsaProblems(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaProblemsData data) =>
      _repository.saveDsaProblems(data.dsaProblems);
}
