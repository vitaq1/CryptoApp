import 'dart:developer';

import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class CurrencyCard extends StatelessWidget {
  final Currency? activeHolding;
  final bool isLoading;

  const CurrencyCard({
    Key? key,
    required this.activeHolding,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        //width: double.infinity,
        height: 80,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        color: Constant.kLightGrayColor),
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SizedBox(width: 24, height: 24,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      width: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(width: 60, height: 16,),
                          ),
                          Container(width: 30, height: 14,)
                        ],
                      ),
                    ),
                  )
                ]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 100,
                        height: 30,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(width: 60, height: 16,),
                            Container(width: 30, height: 14,)
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ),
      );
    }
    else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Constant.kCardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
        ),
        onPressed: (){
        },
        child: SizedBox(
          //width: double.infinity,
          height: 80,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                          color: HexColor(activeHolding!.color)),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset("assets/icons/${activeHolding!.code.toLowerCase()}.svg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                activeHolding!.name,
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.white,

                                    fontSize: 16,
                                    height: 1,
                                    fontWeight: FontWeight.w700),

                              ),
                            ),
                            Text(
                              activeHolding!.code,
                              style: TextStyle(
                                  color: Constant.kLightGrayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 100,
                          height: 30,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${activeHolding!.amount * activeHolding!.exchangeRate}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${activeHolding!.amount} ${activeHolding!.code}",
                                style: TextStyle(
                                    color: Constant.kLightGrayColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      );
    }
  }

}
