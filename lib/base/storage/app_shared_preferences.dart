import 'package:pocket/pocket.dart';

class AppSharedPreferences with PocketCache<IPocketAdapter> {
  AppSharedPreferences(this.adapterDb);

  @override
  final IPocketAdapter adapterDb;

  @override
  String get tableName => 'shared_preferences';
}
