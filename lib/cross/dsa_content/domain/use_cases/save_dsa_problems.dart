import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/core/core.dart';

class SaveDsaProblemsData implements CommandData {
  DsaProblemsAggregateDto items;

  SaveDsaProblemsData(this.items);
}

class SaveDsaProblems implements FutureCommandUseCase<SaveDsaProblemsData> {
  final DsaRepository _repository;

  SaveDsaProblems(
    this._repository,
  );

  @override
  Future<void> call([SaveDsaProblemsData? data]) async {
    print('msg');
  }
}
