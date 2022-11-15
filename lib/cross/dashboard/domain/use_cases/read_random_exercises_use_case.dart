import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadRandomExercisesData extends CommandData {}

class ReadRandomExercisesUseCase
    implements
        FutureQueryUseCase<Iterable<DsaExerciseModel>,
            ReadRandomExercisesData> {
  const ReadRandomExercisesUseCase();

  @override
  Future<Iterable<DsaExerciseModel>> call(ReadRandomExercisesData data) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
