import 'dart:io';

import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

import 'package:Valorant/screens/onboarding.dart';
import 'package:Valorant/utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory dir = await getApplicationDocumentsDirectory();
  await dir.create(recursive: true);
  final String dbPath = join(dir.path, 'data.db');
  final Database db = await databaseFactoryIo.openDatabase(dbPath);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: cSecondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: cSecondaryColor));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: cSecondaryColor,
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: cPrimaryColor, secondary: cSecondaryColor)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: OnboardingScreen()),
    );
  }
}
