import 'package:crypto_app/data/datasource/local/HiveDB.dart';
import 'package:crypto_app/presentation/splash/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../di/DI.dart';

Future<void> main() async {
  //Hive.deleteFromDisk();
  await HiveDB.initialize();
  DI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CryptX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }


}
