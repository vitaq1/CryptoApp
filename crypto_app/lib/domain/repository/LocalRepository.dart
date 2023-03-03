import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity/CurrencyEntity.dart';

import '../../data/datasource/local/HiveDB.dart';
import '../model/Currency.dart';
import '../model/User.dart';

class LocalRepository {
  LocalRepository({required this.db});

  final HiveDB db;

  List<Currency> getCurrencies() {
    List<CurrencyEntity> currencies = db.currencyTable.values.toList().cast();
    return currencies.map((e) => Currency.fromCurrencyEntity(e)).toList();
  }

  addCurrencies(List<Currency> list) {
    db.currencyTable.clear();
    list.forEach((element) {
      db.currencyTable.add(element.toCurrencyEntity());
    });
  }

  Future<Currency> updateExchangeRatesForCurrency(
      Currency currency, List<double> rates) async {
    currency.exchangeRates = rates;
    db.currencyTable.put(currency.key, currency.toCurrencyEntity());
    return currency;
  }

  Future<Currency> buyCurrency(Currency currency, double amount) async {
    currency.amount += amount;
    db.currencyTable.put(currency.key, currency.toCurrencyEntity());
    return currency;
  }

  Future<Currency> sellCurrency(Currency currency, double amount) async {
    if (currency.amount >= amount) {
      currency.amount -= amount;
      db.currencyTable.put(currency.key, currency.toCurrencyEntity());
    }
    return currency;
  }

  User getUser(){
    return User.fromEntity(db.userTable.values.first);
  }

  updateUser(User user) async {
   await db.userTable.putAt(0, user.toUserEntity());
  }
}
