import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app/widgets/widgets.dart';
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
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: NAMEPage(),
    );
  }
}

class NAMEPage extends StatelessWidget {
  /// default constructor
  const NAMEPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Text'),
      ),
      body: Center(
        child: Text('New Page'),
      ),
      bottomNavigationBar: FloatingBottomBar(
        items: [
          BottomElevenItem(
            label: 'Dashboard',
            icon: FontAwesomeIcons.house,
          ),
          BottomElevenItem(
            label: 'Groups',
            icon: FontAwesomeIcons.barsProgress,
          ),
          BottomElevenItem(
            label: 'Problems',
            icon: FontAwesomeIcons.arrowUpRightDots,
          ),
          BottomElevenItem(
            label: 'Solved',
            icon: FontAwesomeIcons.flagCheckered,
          ),
        ],
      ),
    );
  }
}
