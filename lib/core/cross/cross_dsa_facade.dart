import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class CrossDsaFacade {
  CrossDsaFacade(
    this.readAllDsaExercises,
  );

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadAllDsaExercisesData>
      readAllDsaExercises;
}
