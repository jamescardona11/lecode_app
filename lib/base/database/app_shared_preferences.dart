import 'package:pocket/pocket.dart';

class AppSharedPreferences with PocketCache<IPocketAdapter> {
  @override
  IPocketAdapter get adapterDb => SembastPocket.instance();

  @override
  String get tableName => 'shared_preferences';
}
