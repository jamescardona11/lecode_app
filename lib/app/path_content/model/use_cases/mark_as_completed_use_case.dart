import 'package:lepath_app/core/base/base.dart';

class MarkAsCompleteParam {
  MarkAsCompleteParam(this.id);

  final String id;
}

class MarkAsComplete extends FutureCommandUseCase<MarkAsCompleteParam> {
  @override
  Future<void> call(MarkAsCompleteParam data) async {}
}