// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pocket/pocket.dart' as _i5;
import 'package:projectile/projectile.dart' as _i7;

import '../../app/path_content/model/entities/path_content.dart' as _i6;
import '../../app/path_content/model/use_cases/use_cases.dart' as _i4;
import '../../core/api_routes.dart' as _i8;
import '../../core/base/base.dart' as _i3;
import '../../cross/app_init_first_time.dart' as _i10;
import '../../cross/app_repository.dart' as _i9;
import 'di_core.dart' as _i14;
import 'di_model.dart' as _i12;
import 'di_use_cases.dart' as _i11;
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
  final useCasesModule = _$UseCasesModule(get);
  final modelModule = _$ModelModule();
  final viewModelModule = _$ViewModelModule(get);
  final coreModule = _$CoreModule(get);
  gh.singleton<_i3.FutureCommandUseCase<_i4.MarkAsCompleteParam>>(
      useCasesModule.markAsComplete);
  await gh.factoryAsync<_i5.IPocketAdapter>(
    () => modelModule.dbApp,
    preResolve: true,
  );
  gh.singleton<_i6.PathContentModel>(viewModelModule.pathDetailModel);
  gh.singleton<_i4.PathContentUseCasesFacade>(
      useCasesModule.pathDetailUseCasesFacade);
  gh.singleton<_i7.Projectile>(modelModule.projectile);
  gh.factory<String>(
    () => coreModule.baseUrl,
    instanceName: 'BaseURL',
  );
  gh.factory<_i8.ApiRoutes>(
      () => coreModule.apiRoutes(get<String>(instanceName: 'BaseURL')));
  gh.factory<_i9.AppRepository>(() => coreModule.appRepository);
  gh.singleton<_i3.CommandUseCase<_i10.AppInitFirstTimeData>>(
      useCasesModule.appInitFirstTime);
  return get;
}

class _$UseCasesModule extends _i11.UseCasesModule {
  _$UseCasesModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.MarkAsComplete get markAsComplete => _i4.MarkAsComplete();
  @override
  _i4.PathContentUseCasesFacade get pathDetailUseCasesFacade =>
      _i4.PathContentUseCasesFacade(
          _getIt<_i3.FutureCommandUseCase<_i4.MarkAsCompleteParam>>());
  @override
  _i10.AppInitFirstTime get appInitFirstTime =>
      _i10.AppInitFirstTime(_getIt<_i9.AppRepository>());
}

class _$ModelModule extends _i12.ModelModule {}

class _$ViewModelModule extends _i13.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.PathContentModel get pathDetailModel =>
      _i6.PathContentModel(id: _getIt<String>());
}

class _$CoreModule extends _i14.CoreModule {
  _$CoreModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i9.AppRepository get appRepository =>
      _i9.AppRepository(_getIt<_i7.Projectile>());
}
