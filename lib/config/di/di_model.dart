import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/path_content/model/services/path_content_db.dart';
import 'package:lepath_app/core/database/database.dart';

@module
abstract class ModelModule {
  @singleton
  AppSharedPreferences get appSharedPreferences;

  @singleton
  PathContentDatabase get pathContentDatabase;
}
