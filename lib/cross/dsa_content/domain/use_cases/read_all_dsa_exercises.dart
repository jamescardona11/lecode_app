import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadAllDsaExercisesData implements CommandData {
  const ReadAllDsaExercisesData([this.topics = const []]);

  final Iterable<String> topics;
}

class ReadAllDsaExercises
    implements
        StreamQueryUseCase<Iterable<DsaExerciseDto>, ReadAllDsaExercisesData> {
  final DsaListRepository _repository;

  ReadAllDsaExercises(this._repository);

  @override
  Stream<Iterable<DsaExerciseDto>> call(ReadAllDsaExercisesData data) =>
      _repository.readAllDsaExercises
          .map((element) => element.where((item) => data.topics.any(
                (element) => item.topics.contains(element),
              )));
}
