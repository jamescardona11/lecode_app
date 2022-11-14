import 'package:injectable/injectable.dart';
import 'package:lepath_app/cross/cross.dart';

@module
abstract class ModelModule {
  @singleton
  AppRepository get appRepository;

  @singleton
  DsaRepository get dsaRepository;
}
