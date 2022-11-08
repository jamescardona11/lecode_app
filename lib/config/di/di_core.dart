import 'package:injectable/injectable.dart';
import 'package:lepath_app/cross/app_repository.dart';

@module
abstract class CoreModule {
  AppRepository get appRepository;
}
