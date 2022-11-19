import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class CrossDsaFacade {
  CrossDsaFacade(
    this.readAllDsaExercises,
    this.readAllGroups,
  );

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadAllDsaExercisesData>
      readAllDsaExercises;

  final StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData>
      readAllGroups;
}
