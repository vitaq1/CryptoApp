import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/account_bloc.dart';

class AccountView extends StatelessWidget {
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
            icon: const Icon(Icons.settings),
          )),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(),
      child: Stack(children: [
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
                  width: double.maxFinite,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.0,
                          0.4,
                          0.9,
                        ],
                        colors: [
                          Color(0xFFD592A7),
                          Color(0xFFFDE4BE),
                          Color(0xFFA4C0D3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 12, bottom: 12, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Current balance",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        BlocConsumer<AccountBloc, AccountState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is AccountInitial) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Constant.kPurpleColor,
                                      ),
                                    ),
                                  ],
                                );
                              } else if (state is ShowDataState) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${calculateBalance(state.holdings)}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          calculateDiff(state.holdings) > 0
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          color: Constant.kPurpleColor,
                                        ),
                                        Text(
                                          "${!calculateDiff(state.holdings).abs().isNaN ? calculateDiff(state.holdings).abs() : 0.0}%",
                                          style: const TextStyle(
                                              color: Constant.kPurpleColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }
                              return Container(
                                width: 50,
                                height: 50,
                                color: Colors.greenAccent,
                              );
                            })
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
                        onPressed: () {
                          loadData();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(160, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            backgroundColor: Constant.kPurpleColor),
                        child: const Text("Deposit")),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(160, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          side: const BorderSide(
                              style: BorderStyle.solid, color: Colors.white)),
                      child: const Text(
                        "Withdraw",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Holdings",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
              BlocConsumer<AccountBloc, AccountState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  print("Current state: ${state.toString()}");

                  if (state is AccountInitial) {
                    return Expanded(
                        child: ListView.separated(
                            shrinkWrap: false,
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 15);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return const CurrencyCard(
                                activeHolding: null,
                                isLoading: true,
                              );
                            }));
                  } else if (state is ShowDataState) {
                    print("Current elem: ${state.holdings.length}");
                    return Expanded(
                        child: ListView.separated(
                            shrinkWrap: false,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.holdings.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 15);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CurrencyCard(
                                activeHolding: state.holdings[index],
                                isLoading: false,
                              );
                            }));
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        )
      ]),
    );
  }

  double calculateBalance(List<Currency> holdings) {
    var balance = 0.0;
    holdings.forEach((element) {
      balance += element.amount * element.exchangeRates.last;
    });
    return double.parse((balance).toStringAsFixed(2));
  }

  double calculateDiff(List<Currency> holdings) {
    var onStart = 0.0;
    var onEnd = 0.0;
    holdings.forEach((element) {
      onStart += element.amount * element.exchangeRates.first;
      onEnd += element.amount * element.exchangeRates.last;
    });
    return double.parse((((onEnd / onStart) - 1.0) * 100.0).toStringAsFixed(2));
  }

  loadData() async {
    /*var cur1 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(0);
    var cur2 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(1);
    var cur3 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(2);
    cur1!.amount = cur1.amount + 0.25;
    cur2!.amount = cur2.amount + 0.25;
    cur3!.amount = cur3.amount + 0.25;
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(0, cur1);
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(1, cur2);
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(2, cur3);*/
  }
}
