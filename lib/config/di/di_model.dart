import 'package:injectable/injectable.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

@module
abstract class ModelModule {
  @singleton
  Projectile get projectile => Projectile();

  @preResolve
  Future<IPocketAdapter> get dbApp async {
    return await SembastPocket.initAdapter('lepath_app.db');
  }
}
