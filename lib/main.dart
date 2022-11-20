import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lecode_app/app/pages/home_layout.dart';

import 'base/base.dart';
import 'config/di/di.dart';
import 'config/theme/app_theme.dart';
import 'core/core.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();

  getIt<FutureCommandUseCase<AppInitFirstTimeData>>()
      .call(const AppInitFirstTimeData())
      .then((value) async {
    FlutterNativeSplash.remove();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeCode App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const HomeLayout(),
    );
  }
}
