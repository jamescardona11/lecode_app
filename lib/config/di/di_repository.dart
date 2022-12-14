import 'package:injectable/injectable.dart';
import 'package:lecode_app/core/core.dart';

@module
abstract class ModelModule {
  @singleton
  AppRepository get appRepository;

  @singleton
  DsaRepository get dsaRepository;

  @singleton
  DsaRoutesRepository get dsaRoutesRepository;
}
