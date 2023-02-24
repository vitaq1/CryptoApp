import 'dart:developer';

import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity.dart';
import 'package:hive/hive.dart';

import '../../data/datasource/local/HiveDB.dart';
import '../../data/repository/ICryptoRepository.dart';
import '../model/Currency.dart';

class LocalRepository {

  LocalRepository({required this.db});
  final HiveDB db;


  List<Currency> getCurrencies() {
    List<CurrencyEntity> currencies = db.currencyTable.values.toList().cast();
    return currencies.map((e) => Currency.fromCurrencyEntity(e)).toList();
  }

  addCurrencies(List<Currency> list){
    db.currencyTable.clear();
    list.forEach((element) {
      db.currencyTable.add(element.toCurrencyEntity());
    });
  }

  updateExchangeRatesForCurrency(Currency currency, List<double> rates){
    //log("rates count 2: " + rates.length.toString());
    currency.exchangeRates = rates;
    db.currencyTable.put(currency.key, currency.toCurrencyEntity());
  }

}