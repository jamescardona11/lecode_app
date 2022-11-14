import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class MarkAsCompleteData extends CommandData {
  MarkAsCompleteData(this.id);

  final String id;
}

class MarkAsComplete extends FutureCommandUseCase<MarkAsCompleteData> {
  MarkAsComplete(this.repository);

  final DsaRepository repository;

  @override
  Future<void> call(MarkAsCompleteData data) async {
    await repository.markAsComplete(data.id);
  }
}
