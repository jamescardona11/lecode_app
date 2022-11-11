import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/pages/dsa_content/viewmodel/dsa_content_viewmodel.dart';

@module
abstract class ViewModelModule {
  @singleton
  DsaContentViewModel get dsaContentModel;
}
