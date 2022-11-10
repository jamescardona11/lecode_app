import 'package:lepath_app/core/base/remote/remote_app_response.dart';
import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'package:lepath_app/core/remote/remote_repository.dart';
import 'package:lepath_app/core/storage/database.dart';
import 'package:projectile/projectile.dart';

import 'update_info_model.dart';

class AppRepository with RemoteRepository {
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
        '',
        queries: {'action': 'getUpdateInfo'},
      ),
      UpdateInfoModel.fromJson,
    );
  }

  DateTime get _d1990 => DateTime.fromMillisecondsSinceEpoch(658033724000);
}
