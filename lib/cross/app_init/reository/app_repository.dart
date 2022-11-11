import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:projectile/projectile.dart';

class AppRepository with RemoteRepositoryMixin {
  AppRepository(
    this.projectile,
    this._sharedPreferences,
  );

  final AppSharedPreferences _sharedPreferences;
  @override
  final Projectile projectile;

  Future<DateTime> lastUpdateDate() async {
    final lastUpdate = await _sharedPreferences.readInt('last_update');
    return lastUpdate != null
        ? DateTime.fromMillisecondsSinceEpoch(lastUpdate)
        : _d1990;
  }

  // crear my either dynamic para este caso
  Future<RemoteAppResponse<UpdateInfoModel>> getUpdatesInformation() {
    return getSingle<UpdateInfoModel>(
      RemotePackage.get(
        'exec',
        queries: {'action': 'getUpdateInfo'},
      ),
      UpdateInfoModel.fromJson,
    );
  }

  DateTime get _d1990 => DateTime.fromMillisecondsSinceEpoch(658033724000);
}
