import 'package:flutter/material.dart';
import 'package:lepath_app/config/context_extension.dart';

import 'dsa_content_widget.dart';

class ProjectLayout extends StatelessWidget {
  /// default constructor
  const ProjectLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: context.widthPct(30),
            color: Colors.red,
          ),
          Expanded(
            child: ContentView(),
          ),
          Container(
            width: context.widthPct(14),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
