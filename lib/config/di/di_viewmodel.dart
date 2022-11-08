import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/path_detail/model/entities/path_detail.dart';

@module
abstract class ViewModelModule {
  @singleton
  PathDetailModel get pathDetailModel;
}
