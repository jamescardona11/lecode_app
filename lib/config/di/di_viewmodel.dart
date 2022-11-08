import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/path_content/model/entities/path_content.dart';

@module
abstract class ViewModelModule {
  @singleton
  PathContentModel get pathDetailModel;
}
