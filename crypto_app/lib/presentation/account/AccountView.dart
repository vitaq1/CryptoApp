import 'dart:math';

import 'package:crypto_app/domain/model/ActiveHolding.dart';
import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/currency_card.dart';
import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  final MainController c = Get.find();

  var testHoldings = [
    ActiveHolding(
        Currency(code: "BTC", name: "Bitcoin", color: "#111", assetId: ""),
        50,
        20043,
        "assets/icons/btc.svg"),
    ActiveHolding(
        Currency(code: "ETH", name: "Ethereum", color: "#111", assetId: ""),
        10,
        7348,
        "assets/icons/eth.svg"),
    ActiveHolding(
        Currency(code: "LTC", name: "Litecoin", color: "#111", assetId: ""),
        14,
        203,
        "assets/icons/ltc.svg"),
    ActiveHolding(
        Currency(code: "XRP", name: "Ripple", color: "#111", assetId: ""),
        5,
        923,
        "assets/icons/xrp.svg"),
  ];

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Constant.kDarkColor,
        appBar: buildAppBar(),
        body: buildBody(context));
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          SvgPicture.asset(
            "assets/images/curves.svg",
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
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
                height: 120,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$84,723.12",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                color: Constant.kPurpleColor,
                              ),
                              Text(
                                "10.2%",
                                style: TextStyle(
                                    color: Constant.kPurpleColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Deposit"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(160, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          backgroundColor: Constant.kPurpleColor)),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Withdraw",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(160, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        side: BorderSide(
                            style: BorderStyle.solid, color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Holdings",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: testHoldings.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CurrencyCard(
                          activeHolding: testHoldings[index],
                          calculatedHeight: 330 / 4);
                    }))
          ],
        ),
      )
    ]);
  }
}
