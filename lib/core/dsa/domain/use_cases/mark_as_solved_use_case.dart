import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

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
