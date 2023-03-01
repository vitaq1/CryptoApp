
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/BuyCurrency.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/SaveCurrenciesLocally.dart';
import 'package:crypto_app/domain/use_case/SellCurrency.dart';
import 'package:crypto_app/domain/use_case/UpdateExchangeRates.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/Currency.dart';

part 'trading_event.dart';
part 'trading_state.dart';

class TradingBloc extends Bloc<TradingEvent, TradingState> {
  TradingBloc() : super(TradingInitial()) {

    BuyCurrency buyCurrency = Get.find();
    SellCurrency sellCurrency = Get.find();


    on<BuyCurrencyEvent>((event, emit) async {
      var updated = await buyCurrency.call(event.currency, event.amount);
      emit(CurrencyUpdatedState(updated));
    });
    on<SellCurrencyEvent>((event, emit) async {
      var updated = await sellCurrency.call(event.currency, event.amount);
      emit(CurrencyUpdatedState(updated));
    });
    on<UpdateCurrencyEvent>((event, emit) async {
      emit(CurrencyUpdatedState(event.currency));
    });

  }


}
