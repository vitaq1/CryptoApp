import 'dart:developer';

import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/AccountView.dart';
import 'package:crypto_app/presentation/main/MainView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:local_auth/local_auth.dart';

class SplashView extends StatelessWidget {
  String msg = "You are not authorized.";
  final LocalAuthentication auth = LocalAuthentication();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constant.kDarkColor,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "Crypt",
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: "Poppins")),
                      TextSpan(
                          text: "X",
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w700,
                              color: Constant.kPurpleColor,
                              fontFamily: "Poppins")),
                    ]),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 370,
                  height: 370,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "Jump start your crypto portfolio",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 32),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 140),
                      child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Take your investment portfolio to next level",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          fixedSize: const Size(double.maxFinite, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text(
                        "Get started",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                        final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

                        try {
                          final bool didAuthenticate = await auth.authenticate(
                              localizedReason: 'Please authenticate',
                              options: const AuthenticationOptions(useErrorDialogs: false));
                          if (didAuthenticate) {
                            Get.to(MainView());
                          }
                        } on PlatformException catch (e) {
                          log(e.message!);
                          Get.to(MainView());
                        }

                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
