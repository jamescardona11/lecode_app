import 'package:lepath_app/core/database/database.dart';
import 'package:projectile/projectile.dart';

import 'update_info_model.dart';

class AppRepository {
  AppRepository(this.projectile, this._sharedPreferences);

  final Projectile projectile;
  final AppSharedPreferences _sharedPreferences;

  Future<DateTime> lastUpdateDate() async {
    final lastUpdate = await _sharedPreferences.readInt('last_update');
    return lastUpdate != null
        ? DateTime.fromMillisecondsSinceEpoch(lastUpdate)
        : _d1990;
  }

  Future<UpdateInfoModel> getUpdatesInformation() async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: '',
            method: Method.GET,
            query: {'action': 'getUpdateInfo'},
          ),
        )
        .fire();

    return response.fold(
      (error) => UpdateInfoModel(_d1990, false),
      (success) {
        final data = (success.data as Map<String, dynamic>)['data'];
        return UpdateInfoModel(
          DateTime.parse(data['last_update'] as String),
          data['force'] as bool,
        );
      },
    );
  }

  Future<void> initAppInformationForFirstTime() async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: '',
            method: Method.GET,
            urlParams: {'action': 'getLeetcode'},
          ),
        )
        .fire();

    if (response.isFailure) {}
  }

  DateTime get _d1990 => DateTime.fromMillisecondsSinceEpoch(658033724000);
}
