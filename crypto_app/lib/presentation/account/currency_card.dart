import 'dart:developer';

import 'package:crypto_app/domain/model/ActiveHolding.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyCard extends StatelessWidget {
  final ActiveHolding activeHolding;
  final double calculatedHeight;

  const CurrencyCard({
    Key? key,
    required this.activeHolding,
    required this.calculatedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: double.infinity,
      height: calculatedHeight,
      width: double.maxFinite,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Constant.kGrayColor),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(activeHolding.iconPath)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeHolding.currency.name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      activeHolding.currency.code!,
                      style: TextStyle(
                          color: Constant.kLightGrayColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              )
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Container(
                    width: 100,
                    height: 30,
                    color: Colors.greenAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$503.12",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "50 ETH",
                        style: TextStyle(
                            color: Constant.kLightGrayColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
    );
  }
}
