import 'package:lepath_app/app/path_content/model/entities/path_content.dart';
import 'package:lepath_app/app/path_content/repository/path_repository.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/core/base/misc/either/app_right.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';

class FetchAllPathContentData implements CommandData {
  final bool shouldFetch;

  const FetchAllPathContentData(this.shouldFetch);
}

typedef QueryUseCasePathItems = FutureQueryUseCase<
    RemoteAppResponse<Iterable<PathContentModel>>, FetchAllPathContentData>;

class FetchAllPathContent implements QueryUseCasePathItems {
  final PathContentDatabase _repository;

  FetchAllPathContent(
    this._repository,
  );

  @override
  Future<RemoteAppResponse<Iterable<PathContentModel>>> call(
      FetchAllPathContentData data) async {
    if (!data.shouldFetch) return AppRight(RemoteSuccess([]));

    return await _repository.fetchPathContentInformation();
  }
}
