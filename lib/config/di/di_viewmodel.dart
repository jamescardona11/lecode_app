import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/dsa_content/viewmodel/viewmodel.dart';

@module
abstract class ViewModelModule {
  @singleton
  DsaContentViewModel get pathContentModel;
}
