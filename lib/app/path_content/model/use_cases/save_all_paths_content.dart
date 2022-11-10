import 'package:lepath_app/app/path_content/model/entities/path_content.dart';
import 'package:lepath_app/app/path_content/repository/path_repository.dart';
import 'package:lepath_app/core/base/base.dart';

class SaveAllPathContentData implements CommandData {
  Iterable<PathContentModel> items;

  SaveAllPathContentData(this.items);
}

class SaveAllPathContent
    implements FutureCommandUseCase<SaveAllPathContentData> {
  final PathContentDatabase _repository;

  SaveAllPathContent(
    this._repository,
  );

  @override
  Future<void> call([SaveAllPathContentData? data]) async {}
}
