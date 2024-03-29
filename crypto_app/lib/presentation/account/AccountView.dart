import 'dart:developer';

import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/currency_card.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../domain/model/User.dart';
import '../settings/user_cubit/user_cubit.dart';
import 'bloc/account_bloc.dart';

class AccountView extends StatelessWidget {
  final accountBloc = AccountBloc();

  AccountView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: buildAppBar(context),
        body: buildBody(context));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 75,
      toolbarHeight: 90,
      elevation: 0,
      leading: BlocBuilder<UserCubit, User>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20),
            child: CircleAvatar(backgroundImage: NetworkImage(state.avatarUrl)),
          );
        },
      ),
      title: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: IconButton(
            iconSize: 35,
            color: Theme.of(context).textTheme.headlineLarge!.color,
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider.value(
      //create: (context) => accountBloc,
      value: accountBloc,
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
              Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<UserCubit, User>(
                    builder: (context, state) {
                      return Text(
                        "Hello, ${state.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headlineLarge!.color,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      );
                    },
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
                        left: 20.0, top: 12, bottom: 12, right: 16),
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
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                          height: 26,
                                          maxLength: 120,
                                          minLength: 100,
                                          randomLength: true,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                          height: 18,
                                          maxLength: 50,
                                          minLength: 40,
                                          randomLength: true,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    )
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
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Holdings",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.headlineLarge!.color),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).textTheme.headlineLarge!.color),
                        ))
                  ],
                ),
              ),
              BlocConsumer<AccountBloc, AccountState>(
                listener: (context, state) {},
                builder: (context, state) {
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
                              return CurrencyCard(
                                activeHolding: null,
                                isLoading: true,
                              );
                            }));
                  } else if (state is ShowDataState) {
                    return Expanded(
                        child: RefreshIndicator(
                      onRefresh: () {
                        context.read<AccountBloc>().add(UpdateDataEvent());
                        return Future.delayed(Duration(seconds: 2));
                      },
                      child: ListView.separated(
                          shrinkWrap: false,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.holdings.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 15);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return CurrencyCard(
                              activeHolding: state.holdings[index],
                              isLoading: false,
                            );
                          }),
                    ));
                  } else {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    );
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
}
