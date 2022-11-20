import 'package:flutter/material.dart';
import 'package:lepath_app/core/core.dart';

import 'dsa_list_view.dart';

class DsaSolvedProblemsPage extends StatelessWidget {
  /// default constructor
  const DsaSolvedProblemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DsaListView(
        title: 'Solved Problems',
        description: '',
        showProgress: false,
        filteringData: FilteringData(onlySolved: true),
      ),
    );
  }
}
