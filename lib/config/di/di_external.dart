import 'package:injectable/injectable.dart';
import 'package:lepath_app/base/base.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ExternalModule {
  @Named('BaseURL')
  String get baseUrl =>
      'https://script.google.com/macros/s/AKfycbwNSH80y05mSp4vCu673Mtvx-509dUkqyUUMYvMrPN09HInbdyx0vzA9W7NH0sGj-IrWA/';

  @singleton
  Projectile projectile(@Named('BaseURL') String baseUrl) => Projectile(
        config: BaseConfig(
          enableLog: false,
          baseUrl: baseUrl,
        ),
      );

  @preResolve
  Future<IPocketAdapter> get dbApp async {
    return await SembastPocket.initAdapter('lepath_app.db', 2);
  }

  @singleton
  AppSharedPreferences get appSharedPreferences;
}
