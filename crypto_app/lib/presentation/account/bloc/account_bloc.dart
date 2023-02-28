
import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/SaveCurrenciesLocally.dart';
import 'package:crypto_app/domain/use_case/UpdateExchangeRates.dart';
import 'package:get/get.dart';
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

      //await updateExchangeRates.call();
      var holdings = await updateExchangeRates.call();
      if (holdings.isEmpty) {
        await saveCurrenciesLocally.call();
        holdings = await updateExchangeRates.call();
      }
      emit(ShowDataState(holdings));
    });

    loadData();
  }



  loadData(){
    add(LoadDataEvent());
  }
}
