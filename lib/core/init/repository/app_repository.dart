import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

class AppRepository
    with RemoteRepositoryMixin, PocketMultiDataSourceMixin<IPocketAdapter> {
  AppRepository(
    this.adapterDb,
    this.projectile,
    this._sharedPreferences,
  );

  final AppSharedPreferences _sharedPreferences;

  @override
  final Projectile projectile;

  @override
  final IPocketAdapter adapterDb;

  Future<DateTime> readLastUpdateDate() async {
    final lastUpdate = await _sharedPreferences.readInt('last_update');
    return lastUpdate != null
        ? DateTime.fromMillisecondsSinceEpoch(lastUpdate)
        : _d1990;
  }

  Future<void> setNewLastUpdateDate() async {
    await _sharedPreferences.create(
        PrimitiveModel('last_update', DateTime.now().millisecondsSinceEpoch));
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

  Future<RemoteAppResponse<DsaContentProblemsAggregateDto>>
      fetchDSAProblemsInformation() {
    return getSingle<DsaContentProblemsAggregateDto>(
      RemotePackage.get(
        'exec',
        queries: {'action': 'getLeetCode'},
      ),
      DsaContentProblemsAggregateDto.fromJson,
    );
  }

  Future<void> saveDsaGroupsProblems(
      DsaContentProblemsAggregateDto problemsAggregate) async {
    await createMany(
      problemsAggregate.groups,
      tableDsaGroupProblems,
    );
  }

  Future<void> saveDsaProblems(
      DsaContentProblemsAggregateDto problemsAggregate) async {
    await createMany(
      problemsAggregate.dsaProblemDto,
      tableDsaProblem,
    );
  }

  DateTime get _d1990 => DateTime.fromMillisecondsSinceEpoch(658033724000);
}
