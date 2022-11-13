import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/pages/dsa_content/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';

@module
abstract class ViewModelModule {
  @singleton
  DsaContentViewModel get dsaContentModel;

  @singleton
  DsaListViewModel get dsaListViewModel;
}
