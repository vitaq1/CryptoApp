import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  final MainController c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Constant.kDarkColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 75,
          toolbarHeight: 90,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20),
            child: Image.asset("assets/images/man.png"),
          ),
          title: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                iconSize: 35,
                onPressed: () {},
                icon: Icon(Icons.settings),
              )),
        ),
        body: Stack(children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: SvgPicture.asset(
                    "assets/images/curves.svg",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hello, Vitaly",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    width: 370,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Constant.kCashColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 12, bottom: 12, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Current balance",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$84,723.12",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),

                              Row(children: [
                                Icon(Icons.arrow_upward,
                                  color: Constant.kPurpleColor,),
                                Text(
                                  "10.2%",
                                  style: TextStyle(
                                      color: Constant.kPurpleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],)
                            ],)
                        ],
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  ElevatedButton(onPressed: () {},
                    child: Text("Deposit"),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                      return Constant.kPurpleColor;
                    }),))
                ],)
              ],
            ),
          )
        ]));
  }
}
