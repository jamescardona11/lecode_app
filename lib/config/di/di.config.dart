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
import '../../app/pages/dsa_list/viewmodel/viewmodel.dart' as _i9;
import '../../app/pages/dsa_routes/viewmodel/viewmodel.dart' as _i8;
import '../../base/base.dart' as _i4;
import '../../core/core.dart' as _i5;
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
  gh.singleton<_i5.DsaRoutesRepository>(modelModule.dsaRoutesRepository);
  gh.singleton<_i4.FutureCommandUseCase<_i5.MarkAsSolvedData>>(
      useCasesModule.markAsSolved);
  gh.singleton<_i6.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<
      _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
          _i5.ReadAllDsaProblemsData>>(useCasesModule.readAllDsaProblems);
  gh.singleton<
      _i4.StreamQueryUseCase<Iterable<_i5.DsaRouteModel>,
          _i5.ReadAllRoutesData>>(useCasesModule.readAllRoutes);
  gh.singleton<_i5.AppRepository>(modelModule.appRepository);
  gh.singleton<_i5.CrossDsaFacade>(useCasesModule.crossDsaFacade);
  gh.singleton<_i4.FutureCommandUseCase<_i5.SaveDsaRoutesProblemsData>>(
      useCasesModule.saveDsaRoutesProblems);
  gh.singleton<_i4.FutureCommandUseCase<_i5.SaveDsaProblemData>>(
      useCasesModule.saveDsaProblem);
  gh.singleton<
      _i4.FutureQueryUseCase<
          _i4.AppEither<_i4.RemoteError,
              _i4.RemoteSuccess<_i5.DsaContentProblemsAggregateDto>>,
          _i5.FetchDsaProblemsData>>(useCasesModule.fetchDsaProblems);
  gh.singleton<_i5.InitUseCasesFacade>(useCasesModule.initUseCasesFacade);
  gh.singleton<
          _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
              _i5.ReadAllDsaProblemsFilteringData>>(
      useCasesModule.readAllDsaProblemsFiltering);
  gh.singleton<_i4.StreamQueryUseCase<_i5.StatsModel, _i5.ReadStatsData>>(
      useCasesModule.readStatsUseCase);
  gh.singleton<
      _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
          _i5.ReadSimilarProblemsData>>(useCasesModule.readSimilarProblems);
  gh.singleton<
      _i4.StreamQueryUseCase<_i5.DsaProblemModel?,
          _i5.ReadRandomProblemsData>>(useCasesModule.readRandomProblems);
  gh.singleton<
          _i4.StreamQueryUseCase<Iterable<_i5.DsaRouteProblemsModel>,
              _i5.ReadAllRoutesProblemsData>>(
      useCasesModule.readDsaAllRoutesProblems);
  gh.singleton<_i5.DashboardFacade>(useCasesModule.dashboardUseCasesFacade);
  gh.singleton<_i7.DashboardViewModel>(viewModelModule.dashboardViewModel);
  gh.singleton<_i8.DsaRoutesViewModel>(viewModelModule.dsaRoutesViewModel);
  gh.singleton<_i5.DsaUseCasesFacade>(useCasesModule.dsaUseCasesFacade);
  gh.singleton<_i4.FutureCommandUseCase<_i5.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  gh.singleton<_i9.DsaListViewModel>(viewModelModule.dsaListViewModel);
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
  _i5.DsaRoutesRepository get dsaRoutesRepository =>
      _i5.DsaRoutesRepository(_getIt<_i3.IPocketAdapter>());
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
  _i5.MarkAsSolved get markAsSolved =>
      _i5.MarkAsSolved(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadAllDsaProblems get readAllDsaProblems =>
      _i5.ReadAllDsaProblems(_getIt<_i5.DsaRepository>());
  @override
  _i5.ReadAllRoutes get readAllRoutes =>
      _i5.ReadAllRoutes(_getIt<_i5.DsaRoutesRepository>());
  @override
  _i5.CrossDsaFacade get crossDsaFacade => _i5.CrossDsaFacade(_getIt<
      _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
          _i5.ReadAllDsaProblemsData>>());
  @override
  _i5.SaveDsaRoutesProblems get saveDsaRoutesProblems =>
      _i5.SaveDsaRoutesProblems(_getIt<_i5.AppRepository>());
  @override
  _i5.SaveDsaProblem get saveDsaProblem =>
      _i5.SaveDsaProblem(_getIt<_i5.AppRepository>());
  @override
  _i5.FetchDsaProblems get fetchDsaProblems =>
      _i5.FetchDsaProblems(_getIt<_i5.AppRepository>());
  @override
  _i5.InitUseCasesFacade get initUseCasesFacade => _i5.InitUseCasesFacade(
        _getIt<
            _i4.FutureQueryUseCase<
                _i4.AppEither<_i4.RemoteError,
                    _i4.RemoteSuccess<_i5.DsaContentProblemsAggregateDto>>,
                _i5.FetchDsaProblemsData>>(),
        _getIt<_i4.FutureCommandUseCase<_i5.SaveDsaRoutesProblemsData>>(),
        _getIt<_i4.FutureCommandUseCase<_i5.SaveDsaProblemData>>(),
      );
  @override
  _i5.ReadAllDsaProblemsFiltering get readAllDsaProblemsFiltering =>
      _i5.ReadAllDsaProblemsFiltering(
        _getIt<_i5.CrossDsaFacade>(),
        _getIt<_i5.DsaRepository>(),
      );
  @override
  _i5.ReadStatsUseCase get readStatsUseCase => _i5.ReadStatsUseCase(
        _getIt<_i5.CrossDsaFacade>(),
        _getIt<_i5.DsaRepository>(),
      );
  @override
  _i5.ReadSimilarProblemsUseCase get readSimilarProblems =>
      _i5.ReadSimilarProblemsUseCase(
        _getIt<_i5.CrossDsaFacade>(),
        _getIt<_i5.DsaRepository>(),
      );
  @override
  _i5.ReadRandomProblemsUseCase get readRandomProblems =>
      _i5.ReadRandomProblemsUseCase(
        _getIt<_i5.CrossDsaFacade>(),
        _getIt<_i5.DsaRepository>(),
      );
  @override
  _i5.ReadAllRoutesProblems get readDsaAllRoutesProblems =>
      _i5.ReadAllRoutesProblems(
        _getIt<_i5.CrossDsaFacade>(),
        _getIt<
            _i4.StreamQueryUseCase<Iterable<_i5.DsaRouteModel>,
                _i5.ReadAllRoutesData>>(),
      );
  @override
  _i5.DashboardFacade get dashboardUseCasesFacade => _i5.DashboardFacade(
        _getIt<
            _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
                _i5.ReadSimilarProblemsData>>(),
        _getIt<_i4.StreamQueryUseCase<_i5.StatsModel, _i5.ReadStatsData>>(),
        _getIt<
            _i4.StreamQueryUseCase<_i5.DsaProblemModel?,
                _i5.ReadRandomProblemsData>>(),
      );
  @override
  _i5.DsaUseCasesFacade get dsaUseCasesFacade => _i5.DsaUseCasesFacade(
        _getIt<_i4.FutureCommandUseCase<_i5.MarkAsSolvedData>>(),
        _getIt<
            _i4.StreamQueryUseCase<Iterable<_i5.DsaProblemModel>,
                _i5.ReadAllDsaProblemsFilteringData>>(),
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
  _i8.DsaRoutesViewModel get dsaRoutesViewModel =>
      _i8.DsaRoutesViewModel(_getIt<
          _i4.StreamQueryUseCase<Iterable<_i5.DsaRouteProblemsModel>,
              _i5.ReadAllRoutesProblemsData>>());
  @override
  _i9.DsaListViewModel get dsaListViewModel =>
      _i9.DsaListViewModel(_getIt<_i5.DsaUseCasesFacade>());
}
