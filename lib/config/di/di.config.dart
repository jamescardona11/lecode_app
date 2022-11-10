// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i6;
import 'package:projectile/projectile.dart' as _i10;

import '../../app/path_content/model/use_cases/use_cases.dart' as _i5;
import '../../app/path_content/repository/path_repository.dart' as _i7;
import '../../app/path_content/viewmodel/viewmodel.dart' as _i8;
import '../../core/base/base.dart' as _i3;
import '../../core/storage/database.dart' as _i9;
import '../../cross/app_init/app_init_first_time.dart' as _i12;
import '../../cross/app_init/app_repository.dart' as _i11;
import 'di_external.dart' as _i14;
import 'di_repository.dart' as _i15;
import 'di_use_cases.dart' as _i13;
import 'di_viewmodel.dart' as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i5.MarkAsCompleteParam>>(
      useCasesModule.markAsComplete);
  await gh.factoryAsync<_i6.IPocketAdapter>(
    () => externalModule.dbApp,
    preResolve: true,
  );
  gh.singleton<_i7.PathContentDatabase>(modelModule.pathContentDatabase);
  gh.singleton<_i5.PathContentUseCasesFacade>(
      useCasesModule.pathDetailUseCasesFacade);
  gh.singleton<_i8.PathContentViewModel>(viewModelModule.pathContentModel);
  gh.factory<String>(
    () => externalModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.singleton<_i9.AppSharedPreferences>(externalModule.appSharedPreferences);
  gh.singleton<_i10.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.singleton<_i11.AppRepository>(modelModule.appRepository);
  gh.singleton<_i3.BaseUseCase<_i4.Future<void>, _i12.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  return get;
}

class _$UseCasesModule extends _i13.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.MarkAsComplete get markAsComplete => _i5.MarkAsComplete();
  @override
  _i5.PathContentUseCasesFacade get pathDetailUseCasesFacade =>
      _i5.PathContentUseCasesFacade(
          _getIt<_i3.BaseUseCase<_i4.Future<void>, _i5.MarkAsCompleteParam>>());
  @override
  _i12.AppInitFirstTime get appInitFirstTime =>
      _i12.AppInitFirstTime(_getIt<_i11.AppRepository>());
}

class _$ExternalModule extends _i14.ExternalModule {
  _$ExternalModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i9.AppSharedPreferences get appSharedPreferences =>
      _i9.AppSharedPreferences(_getIt<_i6.IPocketAdapter>());
}

class _$ModelModule extends _i15.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.PathContentDatabase get pathContentDatabase =>
      _i7.PathContentDatabase(_getIt<_i6.IPocketAdapter>());
  @override
  _i11.AppRepository get appRepository => _i11.AppRepository(
        _getIt<_i10.Projectile>(),
        _getIt<_i9.AppSharedPreferences>(),
      );
}

class _$ViewModelModule extends _i16.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i8.PathContentViewModel get pathContentModel =>
      _i8.PathContentViewModel(_getIt<_i5.PathContentUseCasesFacade>());
}
