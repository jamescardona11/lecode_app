import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/path_content/viewmodel/viewmodel.dart';

@module
abstract class ViewModelModule {
  @singleton
  PathContentViewModel get pathContentModel;
}
