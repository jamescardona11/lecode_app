import 'package:lepath_app/core/core.dart';

class MarkAsCompleteData extends CommandData {
  MarkAsCompleteData(this.id);

  final String id;
}

class MarkAsComplete extends FutureCommandUseCase<MarkAsCompleteData> {
  @override
  Future<void> call(MarkAsCompleteData data) async {}
}
