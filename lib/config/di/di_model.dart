import 'package:injectable/injectable.dart';

import 'package:lepath_app/core/path_detail/model/use_cases/use_cases.dart';

@module
abstract class ModelModule {
  @singleton
  MarkAsComplete get markAsComplete;

  @singleton
  PathDetailUseCases get pathDetailUseCases;
}
