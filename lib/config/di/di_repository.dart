import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/path_content/repository/path_repository.dart';
import 'package:lepath_app/cross/app_init/app_repository.dart';

@module
abstract class ModelModule {
  @singleton
  AppRepository get appRepository;

  @singleton
  PathContentDatabase get pathContentDatabase;
}
