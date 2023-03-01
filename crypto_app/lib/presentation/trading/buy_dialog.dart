import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/model/Currency.dart';
import '../Constant.dart';
import 'bloc/trading_bloc.dart';

class BuyDialog extends StatelessWidget {
  final Currency activeHolding;
  final controller = TextEditingController();

  BuyDialog({super.key, required this.activeHolding});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Constant.kGrayColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: BlocProvider(
            create: (context) => TradingBloc(),
            child: BlocConsumer<TradingBloc, TradingState>(
              listener: (context, state) {
                if (state is CurrencyUpdatedState) {
                  Navigator.pop(context, state.currency);
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: 300,
                  width: 270,
                  //decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 55,
                                      height: 70,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: SvgPicture.asset(
                                              "assets/icons/${activeHolding.code.toLowerCase()}.svg")),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12, top: 12),
                                      child: SizedBox(
                                        width: 110,
                                        height: 70,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                activeHolding.name,
                                                overflow: TextOverflow.visible,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Text(
                                              activeHolding.code,
                                              style: const TextStyle(
                                                  color:
                                                      Constant.kLightGrayColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(flex: 1,child:
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: "1 ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text: "${activeHolding!.code}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: HexColor(activeHolding!.color),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins")),
                                TextSpan(
                                    text:
                                    " = ${activeHolding!.exchangeRates.last.toStringAsFixed(2)} ",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins")),
                                const TextSpan(
                                    text: "USD",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Poppins")),
                              ])),
                        )
                        ),
                        Expanded(flex: 1,child:
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("You have: ${activeHolding.amount.toStringAsFixed(2)} ${activeHolding.code}", style: TextStyle(color: Constant.kLightGrayColor),)
                        )
                        ),
                        Expanded(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 44,
                                    child: TextField(
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      controller: controller,
                                      showCursor: false,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none)),
                                          contentPadding: EdgeInsets.all(5),
                                          filled: true,
                                          hintStyle: TextStyle(
                                              color: Colors.grey[300]),
                                          hintText: "0.0 ${activeHolding.code}",
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        var amount =
                                            double.tryParse(controller.text);
                                        amount != null ? context.read<TradingBloc>().add(BuyCurrencyEvent(activeHolding, amount)) : printError(info: "incorrect data");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                      child: const SizedBox(
                                          height: 44,
                                          child: Center(
                                              child: Text(
                                            "Buy",
                                            style: TextStyle(fontSize: 20),
                                          ))))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
