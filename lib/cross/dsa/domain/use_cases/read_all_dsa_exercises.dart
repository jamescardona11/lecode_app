import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class ReadAllDsaExercisesData implements CommandData {
  const ReadAllDsaExercisesData([
    this.topics = const [],
    this.takeX = 20,
  ]);

  final Iterable<String> topics;
  final int takeX;
}

class ReadAllDsaExercises
    implements QueryUseCase<Iterable<DsaExerciseDto>, ReadAllDsaExercisesData> {
  final DsaListRepository _repository;

  ReadAllDsaExercises(this._repository) {
    _listenDsaExercises();
  }

  Iterable<DsaExerciseDto> _elements = [];

  void _listenDsaExercises() {
    _repository.readAllDsaExercises.asBroadcastStream().listen((items) {
      _elements = items;
    });
  }

  @override
  Iterable<DsaExerciseDto> call(ReadAllDsaExercisesData data) => _elements
      .where((item) => data.topics.any(
            (element) => item.topics.contains(element),
          ))
      .take(data.takeX);
}
