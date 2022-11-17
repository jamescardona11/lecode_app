import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class MarkAsSolvedData extends CommandData {
  MarkAsSolvedData(this.id);

  final String id;
}

class MarkAsSolved extends FutureCommandUseCase<MarkAsSolvedData> {
  MarkAsSolved(this.repository);

  final DsaRepository repository;

  @override
  Future<void> call(MarkAsSolvedData data) async {
    await repository.markAsComplete(data.id);
  }
}
