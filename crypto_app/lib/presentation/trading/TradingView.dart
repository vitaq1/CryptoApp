import 'dart:developer';

import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/trading/buy_dialog.dart';
import 'package:crypto_app/presentation/trading/sell_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/model/Currency.dart';
import 'bloc/trading_bloc.dart';

class TradingView extends StatelessWidget {
  Currency activeHolding;

  //Currency? activeHolding = Currency(code: "BTC", name: "Bitcoin", color: Colors.amber.toString(), sortIndex: 100,)..exchangeRates = [100,200,300,400,300,200,500]..amount = 5;

  TradingView({
    Key? key,
    required this.activeHolding,
  }) : super(key: key);

  @override
  Widget build(context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, activeHolding);
        //Get.back(result: activeHolding);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: buildAppBar(),
          body: BlocProvider(
            create: (context) => TradingBloc(),
            child: BlocConsumer<TradingBloc, TradingState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  color: CupertinoColors.darkBackgroundGray,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          height: 100,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 10, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    width: 10,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: calculateDiff(activeHolding
                                                    .exchangeRates) >
                                                0
                                            ? Colors.green
                                            : Colors.redAccent,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${calculateBalance(activeHolding)} USD",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          calculateDiff(activeHolding
                                                      .exchangeRates) >
                                                  0
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          color: calculateDiff(activeHolding
                                                      .exchangeRates) >
                                                  0
                                              ? Colors.green
                                              : Colors.redAccent,
                                        ),
                                        Text(
                                          "${calculateDiff(activeHolding.exchangeRates)}%",
                                          style: TextStyle(
                                              color: calculateDiff(
                                                          activeHolding
                                                              .exchangeRates) >
                                                      0
                                                  ? Colors.green
                                                  : Colors.redAccent,
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
                      Expanded(
                        flex: 3,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 300,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  plotAreaBorderWidth: 0,
                                  series: <AreaSeries<ChartData, String>>[
                                    AreaSeries<ChartData, String>(
                                        color:
                                            (activeHolding.exchangeRates.last >
                                                    activeHolding
                                                        .exchangeRates.first)
                                                ? Colors.green.withOpacity(0.1)
                                                : Colors.red.withOpacity(0.1),
                                        borderColor:
                                            (activeHolding.exchangeRates.last >
                                                    activeHolding
                                                        .exchangeRates.first)
                                                ? Colors.green
                                                : Colors.red,
                                        borderWidth: 3,
                                        dataSource: getSalesData(
                                            activeHolding.exchangeRates),
                                        xValueMapper: (ChartData sales, _) =>
                                            sales.date,
                                        yValueMapper: (ChartData sales, _) =>
                                            sales.sales)
                                  ]),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 46),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      activeHolding = await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return BuyDialog(
                                                activeHolding: activeHolding);
                                          });
                                      context.read<TradingBloc>().add(
                                          UpdateCurrencyEvent(activeHolding));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: const SizedBox(
                                        height: 46,
                                        child: Center(
                                            child: Text(
                                          "Buy",
                                          style: TextStyle(fontSize: 20),
                                        )))),
                              )),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ElevatedButton(
                                    onPressed: () async {
                                      activeHolding = await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SellDialog(
                                                activeHolding: activeHolding);
                                          });
                                      context.read<TradingBloc>().add(
                                          UpdateCurrencyEvent(activeHolding));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: const SizedBox(
                                        height: 46,
                                        child: Center(
                                            child: Text(
                                          "Sell",
                                          style: TextStyle(fontSize: 20),
                                        )))),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Exchange rate",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                RichText(
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
                                ]))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leadingWidth: 75,
      toolbarHeight: 75,
      backgroundColor: CupertinoColors.darkBackgroundGray,
      elevation: 0,
      title: SizedBox(
          width: 200,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/${activeHolding!.code.toLowerCase()}.svg",
                width: 30,
              ),
              Text(
                " ${activeHolding!.code} / USD",
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          )),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.kGrayColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Icon(
                Icons.add_chart_outlined,
                color: Colors.white54,
                size: 24,
              ),
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Get.back();
            // Get.to(TradingView(activeHolding: activeHolding));
          },
          style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Constant.kGrayColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  List<ChartData> getSalesData(List<double> doubles) {
    List<ChartData> list = [];
    var now = DateTime.now();
    for (int i = 0; i < doubles.length - 1; i++) {
      var localDate = now.subtract(Duration(days: doubles.length - 1 - i));
      list.add(ChartData(
          "${localDate.day.toString()}.0${localDate.month.toString()}",
          doubles[i]));
    }
    list.add(ChartData(
        "${DateTime.now().day.toString()}.0${now.month.toString()}",
        doubles.last));

    return list;
  }

  double calculateBalance(Currency holding) {
    return double.parse(
        (holding.exchangeRates.last * holding.amount).toStringAsFixed(2));
  }

  double calculateDiff(List<double> rates) {
    var onStart = rates.first;
    var onEnd = rates.last;
    return double.parse((((onEnd / onStart) - 1.0) * 100.0).toStringAsFixed(2));
  }
}

class ChartData {
  ChartData(this.date, this.sales);

  final String date;
  final double sales;
}
