import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
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


    on<LoadDataEvent>((event, emit) async {
      log("start loading");

      await updateExchangeRates.call();
      final holdings = await getAllCurrencies.call();
      log(holdings.first.exchangeRates.length.toString());
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
