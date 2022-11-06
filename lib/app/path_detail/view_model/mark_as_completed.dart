import 'package:lepath_app/core/base/i_use_case.dart';

class MarkAsCompleteParam {
  MarkAsCompleteParam(this.id);

  final String id;
}

class MarkAsComplete extends FutureCommandUseCase<MarkAsCompleteParam> {
  @override
  Future<void> call(MarkAsCompleteParam data) async {}
}
