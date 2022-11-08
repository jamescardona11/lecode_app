// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i5;
import 'package:projectile/projectile.dart' as _i9;

import '../../app/path_content/model/entities/path_content.dart' as _i7;
import '../../app/path_content/model/services/path_content_db.dart' as _i6;
import '../../app/path_content/model/use_cases/use_cases.dart' as _i4;
import '../../core/base/base.dart' as _i3;
import '../../core/database/database.dart' as _i8;
import '../../cross/app_init_first_time.dart' as _i11;
import '../../cross/app_repository.dart' as _i10;
import 'di_core.dart' as _i16;
import 'di_external_libs.dart' as _i13;
import 'di_model.dart' as _i14;
import 'di_use_cases.dart' as _i12;
import 'di_viewmodel.dart' as _i15; // ignore_for_file: unnecessary_lambdas

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
  final externalModule = _$ExternalModule();
  final modelModule = _$ModelModule(get);
  final viewModelModule = _$ViewModelModule(get);
  final coreModule = _$CoreModule(get);
  gh.singleton<_i3.FutureCommandUseCase<_i4.MarkAsCompleteParam>>(
      useCasesModule.markAsComplete);
  await gh.factoryAsync<_i5.IPocketAdapter>(
    () => externalModule.dbApp,
    preResolve: true,
  );
  gh.singleton<_i6.PathContentDatabase>(modelModule.pathContentDatabase);
  gh.singleton<_i7.PathContentModel>(viewModelModule.pathDetailModel);
  gh.singleton<_i4.PathContentUseCasesFacade>(
      useCasesModule.pathDetailUseCasesFacade);
  gh.factory<String>(
    () => externalModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.singleton<_i8.AppSharedPreferences>(modelModule.appSharedPreferences);
  gh.singleton<_i9.Projectile>(
      externalModule.projectile(get<String>(instanceName: 'BaseURL')));
  gh.factory<_i10.AppRepository>(() => coreModule.appRepository);
  gh.singleton<_i3.FacadeUseCase<_i11.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  return get;
}

class _$UseCasesModule extends _i12.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.MarkAsComplete get markAsComplete => _i4.MarkAsComplete();
  @override
  _i4.PathContentUseCasesFacade get pathDetailUseCasesFacade =>
      _i4.PathContentUseCasesFacade(
          _getIt<_i3.FutureCommandUseCase<_i4.MarkAsCompleteParam>>());
  @override
  _i11.AppInitFirstTime get appInitFirstTime =>
      _i11.AppInitFirstTime(_getIt<_i10.AppRepository>());
}

class _$ExternalModule extends _i13.ExternalModule {}

class _$ModelModule extends _i14.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.PathContentDatabase get pathContentDatabase =>
      _i6.PathContentDatabase(_getIt<_i5.IPocketAdapter>());
  @override
  _i8.AppSharedPreferences get appSharedPreferences =>
      _i8.AppSharedPreferences(_getIt<_i5.IPocketAdapter>());
}

class _$ViewModelModule extends _i15.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i7.PathContentModel get pathDetailModel =>
      _i7.PathContentModel(id: _getIt<String>());
}

class _$CoreModule extends _i16.CoreModule {
  _$CoreModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i10.AppRepository get appRepository =>
      _i10.AppRepository(_getIt<_i9.Projectile>());
}
