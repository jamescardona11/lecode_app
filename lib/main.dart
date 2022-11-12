import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lepath_app/app/pages/path/path_page.dart';
import 'package:lepath_app/app/pages/path/path_steps_page.dart';

import 'app/pages/dsa_content/dsa_content_layout.dart';
import 'app/pages/dashboard/dashboard_page.dart';
import 'config/di/di.dart';
import 'config/theme/app_theme.dart';
import 'core/core.dart';
import 'cross/cross.dart';

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
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: PathStepsPage(),
    );
  }
}
