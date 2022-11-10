import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/dsa_content/repository/dsa_repository.dart';
import 'package:lepath_app/cross/app_init/app_repository.dart';

@module
abstract class ModelModule {
  @singleton
  AppRepository get appRepository;

  @singleton
  DsaRepository get dsaRepository;
}
