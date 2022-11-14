import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/core/core.dart';

class SaveDsaExerciseData implements CommandData {
  List<DsaExerciseDto> items;

  SaveDsaExerciseData(this.items);
}

class SaveDsaExercise implements FutureCommandUseCase<SaveDsaExerciseData> {
  final AppRepository _repository;

  SaveDsaExercise(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaExerciseData data) =>
      _repository.saveDsaExercises(data.items);
}
