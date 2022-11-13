// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i6;
import 'package:projectile/projectile.dart' as _i7;

import '../../app/pages/dsa_content/viewmodel/dsa_content_viewmodel.dart'
    as _i8;
import '../../core/core.dart' as _i3;
import '../../cross/cross.dart' as _i5;
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
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.MarkAsCompleteData>>(
      useCasesModule.markAsComplete);
  await gh.factoryAsync<_i6.IPocketAdapter>(
    () => externalModule.dbApp,
    preResolve: true,
  );
  gh.factory<String>(
    () => externalModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.singleton<_i3.AppSharedPreferences>(externalModule.appSharedPreferences);
  gh.singleton<_i7.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<_i5.AppRepository>(modelModule.appRepository);
  gh.singleton<_i5.DsaRepository>(modelModule.dsaRepository);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaProblemsData>>(
      useCasesModule.saveDsaProblems);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaExerciseData>>(
      useCasesModule.saveDsaExercise);
  gh.singleton<
      _i3.BaseUseCase<
          _i4.Future<
              _i3.AppEither<_i3.RemoteError,
                  _i3.RemoteSuccess<_i5.DsaProblemsAggregateDto>>>,
          _i5.FetchDsaProblemsData>>(useCasesModule.fetchDsaProblems);
  gh.singleton<_i5.DsaUseCasesFacade>(useCasesModule.dsaUseCasesFacade);
  gh.singleton<_i8.DsaContentViewModel>(viewModelModule.dsaContentModel);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  return get;
}

class _$UseCasesModule extends _i9.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.MarkAsComplete get markAsComplete => _i5.MarkAsComplete();
  @override
  _i5.SaveDsaProblems get saveDsaProblems =>
      _i5.SaveDsaProblems(_getIt<_i5.DsaRepository>());
  @override
  _i5.SaveDsaExercise get saveDsaExercise =>
      _i5.SaveDsaExercise(_getIt<_i5.DsaRepository>());
  @override
  _i5.FetchDsaProblems get fetchDsaProblems =>
      _i5.FetchDsaProblems(_getIt<_i5.DsaRepository>());
  @override
  _i5.DsaUseCasesFacade get dsaUseCasesFacade => _i5.DsaUseCasesFacade(
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.MarkAsCompleteData>>(),
        _getIt<
            _i3.BaseUseCase<
                _i4.Future<
                    _i3.AppEither<_i3.RemoteError,
                        _i3.RemoteSuccess<_i5.DsaProblemsAggregateDto>>>,
                _i5.FetchDsaProblemsData>>(),
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaProblemsData>>(),
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaExerciseData>>(),
      );
  @override
  _i5.AppInitFirstTime get appInitFirstTime => _i5.AppInitFirstTime(
        _getIt<_i5.AppRepository>(),
        _getIt<_i5.DsaUseCasesFacade>(),
      );
}

class _$ExternalModule extends _i10.ExternalModule {
  _$ExternalModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AppSharedPreferences get appSharedPreferences =>
      _i3.AppSharedPreferences(_getIt<_i6.IPocketAdapter>());
}

class _$ModelModule extends _i11.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.AppRepository get appRepository => _i5.AppRepository(
        _getIt<_i7.Projectile>(),
        _getIt<_i3.AppSharedPreferences>(),
      );
  @override
  _i5.DsaRepository get dsaRepository => _i5.DsaRepository(
        _getIt<_i6.IPocketAdapter>(),
        _getIt<_i7.Projectile>(),
      );
}

class _$ViewModelModule extends _i12.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i8.DsaContentViewModel get dsaContentModel =>
      _i8.DsaContentViewModel(_getIt<_i5.DsaUseCasesFacade>());
}
