import 'package:flutter/material.dart';

import 'app/path_content/project_layout.dart';
import 'config/di/di.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: ProjectLayout(),
    );
  }
}
