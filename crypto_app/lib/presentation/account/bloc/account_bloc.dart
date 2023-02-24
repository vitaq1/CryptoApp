import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/Currency.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {

    GetAllCurrencies getAllCurrencies = Get.find();


    on<LoadDataEvent>((event, emit) {
      log("start loading");
      final holdings = getAllCurrencies.call();
      emit(ShowDataState(holdings));
      log("show data state");
    });
  }
}
