import 'package:flutter/material.dart';
import 'package:lepath_app/app/pages/dsa_list/dsa_list_view.dart';

class DsaAllProblemsPage extends StatelessWidget {
  /// default constructor
  const DsaAllProblemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DsaListView(
        title: 'All problems',
        description: 'Let\'s start solving problems now.',
      ),
    );
  }
}
