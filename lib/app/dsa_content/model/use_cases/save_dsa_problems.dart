import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/app/dsa_content/repository/dsa_repository.dart';
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
