import 'package:flutter/material.dart';
import 'package:lepath_app/config/context_extension.dart';

import 'dsa_content_page.dart';

class DsaContentLayout extends StatelessWidget {
  /// default constructor
  const DsaContentLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DsaContentPage(),
      // body: Row(
      //   children: [
      //     Container(
      //       width: context.widthPct(30),
      //       color: Colors.red,
      //     ),
      //     Expanded(
      //       child: ContentView(),
      //     ),
      //     Container(
      //       width: context.widthPct(14),
      //       color: Colors.amber,
      //     ),
      //   ],
      // ),
    );
  }
}
