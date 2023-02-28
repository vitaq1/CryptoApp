import 'package:crypto_app/data/datasource/local/HiveDB.dart';
import 'package:crypto_app/presentation/splash/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../di/DI.dart';

Future<void> main() async {
  //Hive.deleteFromDisk();
  await HiveDB.initialize();
  DI.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CryptX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),

      home: SplashView(),
    );
  }

  @override
  void dispose() {
    HiveDB.saveData();
    super.dispose();
  }
}
