import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/storage/database.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ExternalModule {
  @Named('BaseURL')
  String get baseUrl =>
      'https://script.google.com/macros/s/AKfycbwKW3HrjlipCaiEccXm7dFKKn3JWM1kiRJYUhE9gl_G0OBQFoitdBbIeRrkVq-Q9fV0zA/exec?action={action}';

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
