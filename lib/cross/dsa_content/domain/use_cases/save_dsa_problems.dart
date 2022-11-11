import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/core/base/base.dart';

class SaveDsaProblemsData implements CommandData {
  DsaExerciseModel items;

  SaveDsaProblemsData(this.items);
}

class SaveDsaProblems implements FutureCommandUseCase<SaveDsaProblemsData> {
  final DsaRepository _repository;

  SaveDsaProblems(
    this._repository,
  );

  @override
  Future<void> call([SaveDsaProblemsData? data]) async {
    print('msg');
  }
}
