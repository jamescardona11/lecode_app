import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class AppInitFirstTimeData implements CommandData {
  const AppInitFirstTimeData();
}

class AppInitFirstTime implements FutureCommandUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(
    this._appRepository,
    this._dsaFacade,
  );

  final AppRepository _appRepository;
  final InitUseCasesFacade _dsaFacade;

  @override
  Future<void> call(AppInitFirstTimeData data) async {
    final response = await _appRepository.getUpdatesInformation();
    if (response.isLeft) return;

    final lastUpdateTime = await _appRepository.readLastUpdateDate();
    final shouldUpdate = shouldUpdateInfo(
      response.right.value,
      lastUpdateTime,
    );

    final elementsResult = await _dsaFacade.fetchDsaProblems
        .call(FetchDsaProblemsData(shouldUpdate));

    if (elementsResult.isRight && shouldUpdate) {
      await _dsaFacade.saveDsaRoutesProblems(
        SaveDsaRoutesProblemsData(
          elementsResult.right.value,
        ),
      );

      await _dsaFacade.saveDsaProblem(
        SaveDsaProblemData(
          elementsResult.right.value,
        ),
      );
    }

    if (shouldUpdate) {
      _appRepository.setNewLastUpdateDate();
    }
  }

  // final isFirstTime = lastUpdateTime.isBefore(DateTime(2022, 1, 1));
  bool shouldUpdateInfo(
    UpdateInfoModel updateInfoModel,
    DateTime lastUpdateTime,
  ) =>
      updateInfoModel.forceUpdate ||
      lastUpdateTime.isBefore(updateInfoModel.lastUpdate);
}
