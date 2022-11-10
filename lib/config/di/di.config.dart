// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i6;
import 'package:projectile/projectile.dart' as _i8;

import '../../app/dsa_content/model/entities/dsa_exercise.dart' as _i13;
import '../../app/dsa_content/model/use_cases/use_cases.dart' as _i5;
import '../../app/dsa_content/repository/dsa_repository.dart' as _i10;
import '../../app/dsa_content/viewmodel/viewmodel.dart' as _i15;
import '../../core/base/base.dart' as _i3;
import '../../core/base/misc/either/either.dart' as _i11;
import '../../core/base/remote/remote_app_response.dart' as _i12;
import '../../core/storage/database.dart' as _i7;
import '../../cross/app_init/app_init_first_time.dart' as _i14;
import '../../cross/app_init/app_repository.dart' as _i9;
import 'di_external.dart' as _i17;
import 'di_repository.dart' as _i18;
import 'di_use_cases.dart' as _i16;
import 'di_viewmodel.dart' as _i19; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i7.AppSharedPreferences>(externalModule.appSharedPreferences);
  gh.singleton<_i8.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<_i9.AppRepository>(modelModule.appRepository);
  gh.singleton<_i10.DsaRepository>(modelModule.dsaRepository);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaProblemsData>>(
      useCasesModule.saveDsaProblems);
  gh.singleton<
      _i3.BaseUseCase<
          _i4.Future<
              _i11.AppEither<_i12.RemoteError,
                  _i12.RemoteSuccess<_i13.DsaExerciseModel>>>,
          _i5.FetchDsaProblemsData>>(useCasesModule.fetchDsaProblems);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i14.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  gh.singleton<_i5.DsaContentUseCasesFacade>(useCasesModule.dsaUseCasesFacade);
  gh.singleton<_i15.DsaContentViewModel>(viewModelModule.dsaContentModel);
  return get;
}

class _$UseCasesModule extends _i16.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.MarkAsComplete get markAsComplete => _i5.MarkAsComplete();
  @override
  _i5.SaveDsaProblems get saveDsaProblems =>
      _i5.SaveDsaProblems(_getIt<_i10.DsaRepository>());
  @override
  _i5.FetchDsaProblems get fetchDsaProblems =>
      _i5.FetchDsaProblems(_getIt<_i10.DsaRepository>());
  @override
  _i14.AppInitFirstTime get appInitFirstTime => _i14.AppInitFirstTime(
        _getIt<_i9.AppRepository>(),
        _getIt<
            _i3.BaseUseCase<
                _i4.Future<
                    _i11.AppEither<_i12.RemoteError,
                        _i12.RemoteSuccess<_i13.DsaExerciseModel>>>,
                _i5.FetchDsaProblemsData>>(),
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaProblemsData>>(),
      );
  @override
  _i5.DsaContentUseCasesFacade get dsaUseCasesFacade =>
      _i5.DsaContentUseCasesFacade(
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.MarkAsCompleteData>>(),
        _getIt<
            _i3.BaseUseCase<
                _i4.Future<
                    _i11.AppEither<_i12.RemoteError,
                        _i12.RemoteSuccess<_i13.DsaExerciseModel>>>,
                _i5.FetchDsaProblemsData>>(),
        _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.SaveDsaProblemsData>>(),
      );
}

class _$ExternalModule extends _i17.ExternalModule {
  _$ExternalModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.AppSharedPreferences get appSharedPreferences =>
      _i7.AppSharedPreferences(_getIt<_i6.IPocketAdapter>());
}

class _$ModelModule extends _i18.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i9.AppRepository get appRepository => _i9.AppRepository(
        _getIt<_i8.Projectile>(),
        _getIt<_i7.AppSharedPreferences>(),
      );
  @override
  _i10.DsaRepository get dsaRepository => _i10.DsaRepository(
        _getIt<_i6.IPocketAdapter>(),
        _getIt<_i8.Projectile>(),
      );
}

class _$ViewModelModule extends _i19.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i15.DsaContentViewModel get dsaContentModel =>
      _i15.DsaContentViewModel(_getIt<_i5.DsaContentUseCasesFacade>());
}
