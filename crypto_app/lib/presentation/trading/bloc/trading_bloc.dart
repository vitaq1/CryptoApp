
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/SaveCurrenciesLocally.dart';
import 'package:crypto_app/domain/use_case/UpdateExchangeRates.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/Currency.dart';

part 'trading_event.dart';
part 'trading_state.dart';

class TradingBloc extends Bloc<TradingEvent, TradingState> {
  TradingBloc() : super(TradingInitial()) {

    UpdateExchangeRates updateExchangeRates = Get.find();
    GetAllCurrencies getAllCurrencies = Get.find();
    SaveCurrenciesLocally saveCurrenciesLocally = Get.find();


    on<LoadDataEvent>((event, emit) async {

    });

  }


}
