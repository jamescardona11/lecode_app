// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i3;
import 'package:projectile/projectile.dart' as _i6;

import '../../app/pages/dashboard/viewmodel/dashboard_viewmodel.dart' as _i7;
import '../../app/pages/dsa_content/viewmodel/viewmodel.dart' as _i8;
import '../../app/pages/dsa_list/viewmodel/viewmodel.dart' as _i9;
import '../../core/core.dart' as _i4;
import '../../cross/cross.dart' as _i5;
import 'di_external.dart' as _i10;
import 'di_repository.dart' as _i11;
import 'di_use_cases.dart' as _i12;
import 'di_viewmodel.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final externalModule = _$ExternalModule(get);
  final modelModule = _$ModelModule(get);
  final useCasesModule = _$UseCasesModule(get);
  final viewModelModule = _$ViewModelModule(get);
  await gh.factoryAsync<_i3.IPocketAdapter>(
    () => externalModule.dbApp,
    preResolve: true,
  );
  gh.factory<String>(
    () => externalModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.singleton<_i4.AppSharedPreferences>(externalModule.appSharedPreferences);
  gh.singleton<_i5.DsaRepository>(modelModule.dsaRepository);
  gh.singleton<_i4.FutureCommandUseCase<_i5.MarkAsCompleteData>>(
      useCasesModule.markAsComplete);
  gh.singleton<_i6.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<
          _i4.StreamQueryUseCase<Iterable<_i5.DsaExerciseModel>,
              _i5.ReadAllDsaExercisesWithPaginationData>>(
      useCasesModule.readAllDsaExercisesWithPagination);
  gh.singleton<_i4.StreamQueryUseCase<_i5.StatsModel, _i5.ReadStatsData>>(
      useCasesModule.readStatsUseCase);
  gh.singleton<
      _i4.StreamQueryUseCase<Iterable<_i5.DsaExerciseModel>,
          _i5.ReadSimilarExercisesData>>(useCasesModule.readSimilarExercises);
  gh.singleton<
      _i4.StreamQueryUseCase<_i5.DsaExerciseModel?,
          _i5.ReadRandomExercisesData>>(useCasesModule.readRandomExercises);
  gh.singleton<_i5.AppRepository>(modelModule.appRepository);
  gh.singleton<_i5.DashboardFacade>(useCasesModule.dashboardUseCasesFacade);
  gh.singleton<_i7.DashboardViewModel>(viewModelModule.dashboardViewModel);
  gh.singleton<_i5.DsaUseCasesFacade>(useCasesModule.dsaUseCasesFacade);
  gh.singleton<_i4.FutureCommandUseCase<_i5.SaveDsaProblemsData>>(
      useCasesModule.saveDsaProblems);
  gh.singleton<_i4.FutureCommandUseCase<_i5.SaveDsaExerciseData>>(
      useCasesModule.saveDsaExercise);
  gh.singleton<
      _i4.FutureQueryUseCase<
          _i4.AppEither<_i4.RemoteError,
              _i4.RemoteSuccess<_i5.DsaProblemsAggregateDto>>,
          _i5.FetchDsaProblemsData>>(useCasesModule.fetchDsaProblems);
  gh.singleton<_i5.InitUseCasesFacade>(useCasesModule.initUseCasesFacade);
  gh.singleton<_i8.DsaContentViewModel>(viewModelModule.dsaContentModel);
  gh.singleton<_i9.DsaListViewModel>(viewModelModule.dsaListViewModel);
  gh.singleton<_i4.FutureCommandUseCase<_i5.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  return get;
}

class _$ExternalModule extends _i10.ExternalModule {
  _$ExternalModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.AppSharedPreferences get appSharedPreferences =>
      _i4.AppSharedPreferences(_getIt<_i3.IPocketAdapter>());
}

class _$ModelModule extends _i11.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.DsaRepository get dsaRepository =>
      _i5.DsaRepository(_getIt<_i3.IPocketAdapter>());
  @override
  _i5.AppRepository get appRepository => _i5.AppRepository(
        _getIt<_i3.IPocketAdapter>(),
        _getIt<_i6.Projectile>(),
        _getIt<_i4.AppSharedPreferences>(),
      );
}

class _$UseCasesModule extends _i12.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.MarkAsComplete get markAsComplete =>
      _i5.MarkAsComplete(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadAllDsaExercisesWithPagination get readAllDsaExercisesWithPagination =>
      _i5.ReadAllDsaExercisesWithPagination(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadStatsUseCase get readStatsUseCase =>
      _i5.ReadStatsUseCase(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadSimilarExercisesUseCase get readSimilarExercises =>
      _i5.ReadSimilarExercisesUseCase(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadRandomExercisesUseCase get readRandomExercises =>
      _i5.ReadRandomExercisesUseCase(_getIt<_i5.DsaRepository>());
  @override
  _i5.DashboardFacade get dashboardUseCasesFacade => _i5.DashboardFacade(
        _getIt<
            _i4.StreamQueryUseCase<Iterable<_i5.DsaExerciseModel>,
                _i5.ReadSimilarExercisesData>>(),
        _getIt<_i4.StreamQueryUseCase<_i5.StatsModel, _i5.ReadStatsData>>(),
        _getIt<
            _i4.StreamQueryUseCase<_i5.DsaExerciseModel?,
                _i5.ReadRandomExercisesData>>(),
      );
  @override
  _i5.DsaUseCasesFacade get dsaUseCasesFacade => _i5.DsaUseCasesFacade(
        _getIt<_i4.FutureCommandUseCase<_i5.MarkAsCompleteData>>(),
        _getIt<
            _i4.StreamQueryUseCase<Iterable<_i5.DsaExerciseModel>,
                _i5.ReadAllDsaExercisesWithPaginationData>>(),
      );
  @override
  _i5.SaveDsaProblems get saveDsaProblems =>
      _i5.SaveDsaProblems(_getIt<_i5.AppRepository>());
  @override
  _i5.SaveDsaExercise get saveDsaExercise =>
      _i5.SaveDsaExercise(_getIt<_i5.AppRepository>());
  @override
  _i5.FetchDsaProblems get fetchDsaProblems =>
      _i5.FetchDsaProblems(_getIt<_i5.AppRepository>());
  @override
  _i5.InitUseCasesFacade get initUseCasesFacade => _i5.InitUseCasesFacade(
        _getIt<
            _i4.FutureQueryUseCase<
                _i4.AppEither<_i4.RemoteError,
                    _i4.RemoteSuccess<_i5.DsaProblemsAggregateDto>>,
                _i5.FetchDsaProblemsData>>(),
        _getIt<_i4.FutureCommandUseCase<_i5.SaveDsaProblemsData>>(),
        _getIt<_i4.FutureCommandUseCase<_i5.SaveDsaExerciseData>>(),
      );
  @override
  _i5.AppInitFirstTime get appInitFirstTime => _i5.AppInitFirstTime(
        _getIt<_i5.AppRepository>(),
        _getIt<_i5.InitUseCasesFacade>(),
      );
}

class _$ViewModelModule extends _i13.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.DashboardViewModel get dashboardViewModel =>
      _i7.DashboardViewModel(_getIt<_i5.DashboardFacade>());
  @override
  _i8.DsaContentViewModel get dsaContentModel =>
      _i8.DsaContentViewModel(_getIt<_i5.DsaUseCasesFacade>());
  @override
  _i9.DsaListViewModel get dsaListViewModel =>
      _i9.DsaListViewModel(_getIt<_i5.DsaUseCasesFacade>());
}
