// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i5;
import 'package:projectile/projectile.dart' as _i6;

import '../../app/pages/dsa_content/viewmodel/viewmodel.dart' as _i7;
import '../../app/pages/dsa_list/viewmodel/viewmodel.dart' as _i8;
import '../../core/core.dart' as _i3;
import '../../cross/cross.dart' as _i4;
import 'di_external.dart' as _i10;
import 'di_repository.dart' as _i11;
import 'di_use_cases.dart' as _i9;
import 'di_viewmodel.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
  final useCasesModule = _$UseCasesModule(get);
  final externalModule = _$ExternalModule(get);
  final modelModule = _$ModelModule(get);
  final viewModelModule = _$ViewModelModule(get);
  gh.singleton<_i3.FutureCommandUseCase<_i4.MarkAsCompleteData>>(
      useCasesModule.markAsComplete);
  await gh.factoryAsync<_i5.IPocketAdapter>(
    () => externalModule.dbApp,
    preResolve: true,
  );
  gh.factory<String>(
    () => externalModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.singleton<_i3.AppSharedPreferences>(externalModule.appSharedPreferences);
  gh.singleton<_i4.DsaListRepository>(modelModule.dsaListRepository);
  gh.singleton<_i6.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<
      _i3.StreamQueryUseCase<Iterable<_i4.DsaExerciseModel>,
          _i4.ReadAllDsaExercisesData>>(useCasesModule.readAllDsaExercises);
  gh.singleton<_i4.AppRepository>(modelModule.appRepository);
  gh.singleton<_i4.DsaRepository>(modelModule.dsaRepository);
  gh.singleton<_i3.FutureCommandUseCase<_i4.SaveDsaProblemsData>>(
      useCasesModule.saveDsaProblems);
  gh.singleton<_i3.FutureCommandUseCase<_i4.SaveDsaExerciseData>>(
      useCasesModule.saveDsaExercise);
  gh.singleton<
      _i3.FutureQueryUseCase<
          _i3.AppEither<_i3.RemoteError,
              _i3.RemoteSuccess<_i4.DsaProblemsAggregateDto>>,
          _i4.FetchDsaProblemsData>>(useCasesModule.fetchDsaProblems);
  gh.singleton<_i4.DsaUseCasesFacade>(useCasesModule.dsaUseCasesFacade);
  gh.singleton<_i3.FutureCommandUseCase<_i4.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  gh.singleton<_i7.DsaContentViewModel>(viewModelModule.dsaContentModel);
  gh.singleton<_i8.DsaListViewModel>(viewModelModule.dsaListViewModel);
  return get;
}

class _$UseCasesModule extends _i9.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.MarkAsComplete get markAsComplete => _i4.MarkAsComplete();
  @override
  _i4.ReadAllDsaExercises get readAllDsaExercises =>
      _i4.ReadAllDsaExercises(_getIt<_i4.DsaListRepository>());
  @override
  _i4.SaveDsaProblems get saveDsaProblems =>
      _i4.SaveDsaProblems(_getIt<_i4.DsaRepository>());
  @override
  _i4.SaveDsaExercise get saveDsaExercise =>
      _i4.SaveDsaExercise(_getIt<_i4.DsaRepository>());
  @override
  _i4.FetchDsaProblems get fetchDsaProblems =>
      _i4.FetchDsaProblems(_getIt<_i4.DsaRepository>());
  @override
  _i4.DsaUseCasesFacade get dsaUseCasesFacade => _i4.DsaUseCasesFacade(
        _getIt<_i3.FutureCommandUseCase<_i4.MarkAsCompleteData>>(),
        _getIt<
            _i3.FutureQueryUseCase<
                _i3.AppEither<_i3.RemoteError,
                    _i3.RemoteSuccess<_i4.DsaProblemsAggregateDto>>,
                _i4.FetchDsaProblemsData>>(),
        _getIt<_i3.FutureCommandUseCase<_i4.SaveDsaProblemsData>>(),
        _getIt<_i3.FutureCommandUseCase<_i4.SaveDsaExerciseData>>(),
        _getIt<
            _i3.StreamQueryUseCase<Iterable<_i4.DsaExerciseModel>,
                _i4.ReadAllDsaExercisesData>>(),
      );
  @override
  _i4.AppInitFirstTime get appInitFirstTime => _i4.AppInitFirstTime(
        _getIt<_i4.AppRepository>(),
        _getIt<_i4.DsaUseCasesFacade>(),
      );
}

class _$ExternalModule extends _i10.ExternalModule {
  _$ExternalModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AppSharedPreferences get appSharedPreferences =>
      _i3.AppSharedPreferences(_getIt<_i5.IPocketAdapter>());
}

class _$ModelModule extends _i11.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.DsaListRepository get dsaListRepository =>
      _i4.DsaListRepository(_getIt<_i5.IPocketAdapter>());
  @override
  _i4.AppRepository get appRepository => _i4.AppRepository(
        _getIt<_i6.Projectile>(),
        _getIt<_i3.AppSharedPreferences>(),
      );
  @override
  _i4.DsaRepository get dsaRepository => _i4.DsaRepository(
        _getIt<_i5.IPocketAdapter>(),
        _getIt<_i6.Projectile>(),
      );
}

class _$ViewModelModule extends _i12.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.DsaContentViewModel get dsaContentModel =>
      _i7.DsaContentViewModel(_getIt<_i4.DsaUseCasesFacade>());
  @override
  _i8.DsaListViewModel get dsaListViewModel =>
      _i8.DsaListViewModel(_getIt<_i4.DsaUseCasesFacade>());
}
