import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/core.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ExternalModule {
  @Named('BaseURL')
  String get baseUrl =>
      'https://script.google.com/macros/s/AKfycbx0Ba7PQ_TG1PMLL7GksdPRUO_Qmu_Wx4S7vsb_fmMhAJfYaqqo50oE2oMN65A7VfsEvg/';

  @singleton
  Projectile projectile(@Named('BaseURL') String baseUrl) => Projectile(
        config: BaseConfig(
          enableLog: false,
          baseUrl: baseUrl,
        ),
      );

  @preResolve
  Future<IPocketAdapter> get dbApp async {
    return await SembastPocket.initAdapter('lepath_app.db');
  }

  @singleton
  AppSharedPreferences get appSharedPreferences;
}
