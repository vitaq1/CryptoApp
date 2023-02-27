
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/SaveCurrenciesLocally.dart';
import 'package:crypto_app/domain/use_case/UpdateExchangeRates.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/Currency.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {

    UpdateExchangeRates updateExchangeRates = Get.find();
    GetAllCurrencies getAllCurrencies = Get.find();
    SaveCurrenciesLocally saveCurrenciesLocally = Get.find();


    on<LoadDataEvent>((event, emit) async {

      await updateExchangeRates.call();
      var holdings = await getAllCurrencies.call();
      if (holdings.isEmpty) {
        log("In if");
        await saveCurrenciesLocally.call();
        holdings = await updateExchangeRates.call();
        log("Out if");
      }
      log("After if");
      holdings.forEach((element) {
        log("code: ${element.code}");
        log("rate: ${element.exchangeRates.length}");
        //log("last elem: ${element.exchangeRates.last}");
      });
      //log(holdings.first.exchangeRates.length.toString());
      //await Future.delayed(Duration(seconds: 1));
      emit(ShowDataState(holdings));
      log("show data state");
    });

    loadData();
  }



  loadData(){
    add(LoadDataEvent());
  }
}