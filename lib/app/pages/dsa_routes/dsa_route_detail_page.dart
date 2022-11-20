import 'package:flutter/material.dart';
import 'package:lepath_app/app/pages/dsa_list/dsa_list_view.dart';
import 'package:lepath_app/core/core.dart';

class DsaRouteDetailPage extends StatelessWidget {
  /// default constructor
  const DsaRouteDetailPage({
    super.key,
    required this.dsaRouteProblemsModel,
    required this.icon,
    required this.color,
  });

  final DsaRouteProblemsModel dsaRouteProblemsModel;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DsaListView(
        title: dsaRouteProblemsModel.id,
        description: dsaRouteProblemsModel.description,
        color: color,
        icon: icon,
      ),
    );
  }
}
