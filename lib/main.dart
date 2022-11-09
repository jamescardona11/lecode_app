import 'package:flutter/material.dart';
import 'package:lepath_app/cross/app_init/app_init_first_time.dart';

import 'app/path_content/project_layout.dart';
import 'config/di/di.dart';
import 'core/base/base.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // await getIt<FacadeUseCase<AppInitFirstTimeData>>().call();

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
