import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/main/MainView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: double.infinity,
        backgroundColor: Constant.kDarkColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Crypt",
                  style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
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
      body: Container(
        color: Constant.kDarkColor,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 50),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 370,
                  height: 370,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text(
                "Jump start your crypto portfolio",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 32),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 30, right: 140),
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
            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Constant.kPurpleColor;
                    }),
                    fixedSize:
                    MaterialStateProperty.resolveWith((states) {
                      return Size(320, 60);
                    }),
                    shape: MaterialStateProperty.resolveWith((states) {
                      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
                    }),
                  ),
                  child: Text(
                    "Get started",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Get.to(MainView());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
