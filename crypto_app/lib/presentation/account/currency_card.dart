import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/bloc/account_bloc.dart';
import 'package:crypto_app/presentation/trading/TradingView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CurrencyCard extends StatelessWidget {
  Currency? activeHolding;
  final bool isLoading;

  CurrencyCard({
    Key? key,
    required this.activeHolding,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Constant.kGrayColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
        onPressed: () {},
        child: SkeletonItem(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 90,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.rectangle,
                            width: 55,
                            height: 55,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 6),
                        child: SizedBox(
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: Container(
                                height: 14,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                              )),
                              const SizedBox(height: 5),
                              Container(
                                height: 12,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Constant.kLightGrayColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 120,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 12,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 11,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Constant.kLightGrayColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      );
    } else {
      return BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Constant.kCardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
            onPressed: () async {
              activeHolding =
                  await Get.to(TradingView(activeHolding: activeHolding!));
              context
                  .read<AccountBloc>()
                  .add(UpdateCurrencyEvent(activeHolding!));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                width: double.maxFinite,
                height: 90,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor(activeHolding!.color)),
                            child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                    "assets/icons/${activeHolding!.code.toLowerCase()}.svg")),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 6),
                          child: SizedBox(
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    activeHolding!.name,
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    maxLines: 4,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        height: 1,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  activeHolding!.code,
                                  style: const TextStyle(
                                      color: Constant.kLightGrayColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SizedBox(
                              width: 100,
                              height: 40,
                              child: SfSparkAreaChart(
                                data: activeHolding!.exchangeRates,
                                //color: Colors.greenAccent,
                                borderColor:
                                    (activeHolding!.exchangeRates.last >
                                            activeHolding!.exchangeRates.first)
                                        ? Colors.green
                                        : Colors.red,
                                borderWidth: 3,
                                color: (activeHolding!.exchangeRates.last >
                                        activeHolding!.exchangeRates.first)
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                axisLineWidth: 0,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: SizedBox(
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${double.parse((activeHolding!.amount * activeHolding!.exchangeRates.last).toStringAsFixed(2))}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      overflow: TextOverflow.visible,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${double.parse((activeHolding!.amount).toStringAsFixed(2))} ${activeHolding!.code}",
                                  style: const TextStyle(
                                      color: Constant.kLightGrayColor,
                                      overflow: TextOverflow.visible,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        },
      );
    }
  }
}
