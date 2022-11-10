import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/dsa_content/dsa_content_layout.dart';
import 'config/di/di.dart';
import 'core/base/use_cases/i_use_case.dart';
import 'cross/app_init/app_init_first_time.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();

  getIt<FutureCommandUseCase<AppInitFirstTimeData>>()
      .call(const AppInitFirstTimeData())
      .then((value) async {
    // await Future.delayed(const Duration(milliseconds: 800));
    FlutterNativeSplash.remove();
  });

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
