import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadRandomExercisesData extends CommandData {}

class ReadRandomExercisesUseCase
    implements StreamQueryUseCase<DsaExerciseModel, ReadRandomExercisesData> {
  const ReadRandomExercisesUseCase(this.repository);

  final DsaRepository repository;

  @override
  Stream<DsaExerciseModel> call(ReadRandomExercisesData data) {
    return repository.readAllDsaExercises
        .expand((element) => element)
        .where((item) => item.solvedDate == null);
  }
}
