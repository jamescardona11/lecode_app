import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/dsa_list_viewmodel.dart';
import 'package:lepath_app/app/pages/dsa_routes/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/pages/solved_list/viewmodel/dsa_solved_list_viewmodel.dart';

@module
abstract class ViewModelModule {
  @singleton
  DsaRoutesViewModel get dsaRoutesViewModel;

  @singleton
  DsaListViewModel get dsaListViewModel;

  @singleton
  DashboardViewModel get dashboardViewModel;

  @singleton
  DsaSolvedListViewModel get dsaSolvedListViewModel;
}
