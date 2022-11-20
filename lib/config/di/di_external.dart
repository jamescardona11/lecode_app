import 'package:injectable/injectable.dart';
import 'package:lecode_app/base/base.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ExternalModule {
  @Named('BaseURL')
  String get baseUrl =>
      'https://script.google.com/macros/s/AKfycbzs-nf1KMFcZLa8w9HWMaC2HXuukEUT6KyYQNJ6v9JbGWc5NhmSUXkCLGHE3eJ9kw_WgQ/';

  @singleton
  Projectile projectile(@Named('BaseURL') String baseUrl) => Projectile(
        config: BaseConfig(
          enableLog: false,
          baseUrl: baseUrl,
        ),
      );

  @preResolve
  Future<IPocketAdapter> get dbApp async {
    return await SembastPocket.initAdapter('lecode_app.db', 2);
  }

  @singleton
  AppSharedPreferences get appSharedPreferences;
}
