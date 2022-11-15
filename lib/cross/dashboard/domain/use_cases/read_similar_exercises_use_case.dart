import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadSimilarExercisesData extends CommandData {}

class ReadSimilarExercisesUseCase
    implements
        StreamQueryUseCase<Iterable<DsaExerciseModel>,
            ReadSimilarExercisesData> {
  const ReadSimilarExercisesUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Stream<Iterable<DsaExerciseModel>> call(ReadSimilarExercisesData data) =>
      repository.readSimilarExercises;
}
