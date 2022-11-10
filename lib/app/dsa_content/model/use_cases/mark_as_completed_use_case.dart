import 'package:lepath_app/core/base/base.dart';

class MarkAsCompleteData extends CommandData {
  MarkAsCompleteData(this.id);

  final String id;
}

class MarkAsComplete extends BaseUseCase<Future<void>, MarkAsCompleteData> {
  @override
  Future<void> call(MarkAsCompleteData data) async {}
}
