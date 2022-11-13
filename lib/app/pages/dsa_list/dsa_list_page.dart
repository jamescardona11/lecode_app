import 'package:flutter/material.dart';
import 'package:lepath_app/config/context_extension.dart';

class DsaListPage extends StatelessWidget {
  /// default constructor
  const DsaListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: context.widthPx,
          height: 50,
          margin: const EdgeInsets.all(8),
          color: Colors.red,
        ),
      ),
    );
  }
}
