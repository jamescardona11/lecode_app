// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/path_detail/model/entities/path_detail.dart' as _i4;
import '../../core/path_detail/model/use_cases/use_cases.dart' as _i3;
import 'di_model.dart' as _i5;
import 'di_viewmodel.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final modelModule = _$ModelModule(get);
  final viewModelModule = _$ViewModelModule(get);
  gh.singleton<_i3.MarkAsComplete>(modelModule.markAsComplete);
  gh.singleton<_i4.PathDetailModel>(viewModelModule.pathDetailModel);
  gh.singleton<_i3.PathDetailUseCases>(modelModule.pathDetailUseCases);
  return get;
}

class _$ModelModule extends _i5.ModelModule {
  _$ModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.MarkAsComplete get markAsComplete => _i3.MarkAsComplete();
  @override
  _i3.PathDetailUseCases get pathDetailUseCases =>
      _i3.PathDetailUseCases(_getIt<_i3.MarkAsComplete>());
}

class _$ViewModelModule extends _i6.ViewModelModule {
  _$ViewModelModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.PathDetailModel get pathDetailModel =>
      _i4.PathDetailModel(id: _getIt<String>());
}
