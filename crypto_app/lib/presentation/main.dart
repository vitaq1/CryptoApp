import 'package:crypto_app/data/datasource/local/HiveDB.dart';
import 'package:crypto_app/presentation/settings/user_cubit/user_cubit.dart';
import 'package:crypto_app/presentation/splash/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => UserCubit(),
      child: GetMaterialApp(
        title: 'CryptX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          colorScheme: ColorScheme.dark()
        ),

        home: SplashView(),
      ),
    );
  }

  @override
  void dispose() {
    HiveDB.saveData();
    super.dispose();
  }
}
