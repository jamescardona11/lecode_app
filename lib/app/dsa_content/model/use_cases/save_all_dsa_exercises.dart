import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/app/dsa_content/repository/dsa_repository.dart';
import 'package:lepath_app/core/base/base.dart';

class SaveAllDsaExercisesData implements CommandData {
  DsaExerciseModel items;

  SaveAllDsaExercisesData(this.items);
}

class SaveAllPathContent
    implements FutureCommandUseCase<SaveAllDsaExercisesData> {
  final PathContentDatabase _repository;

  SaveAllPathContent(
    this._repository,
  );

  @override
  Future<void> call([SaveAllDsaExercisesData? data]) async {
    print('msg');
  }
}
