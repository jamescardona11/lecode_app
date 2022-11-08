import 'package:injectable/injectable.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ExternalModule {
  @Named('BaseURL')
  String get baseUrl => '';

  @singleton
  Projectile projectile(@Named('BaseURL') String baseUrl) => Projectile(
        config: BaseConfig(
          baseUrl: baseUrl,
        ),
      );

  @preResolve
  Future<IPocketAdapter> get dbApp async {
    return await SembastPocket.initAdapter('lepath_app.db');
  }
}
