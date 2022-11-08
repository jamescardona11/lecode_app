import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/api_routes.dart';
import 'package:lepath_app/cross/app_repository.dart';

@module
abstract class CoreModule {
  @Named('BaseURL')
  String get baseUrl => '';

  ApiRoutes apiRoutes(@Named('BaseURL') String baseUrl) => ApiRoutes(baseUrl);

  AppRepository get appRepository;
}
