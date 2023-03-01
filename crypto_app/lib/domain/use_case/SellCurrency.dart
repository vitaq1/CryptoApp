import 'package:crypto_app/domain/model/ExchangeRate.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:intl/intl.dart';

import '../model/Currency.dart';
import '../repository/RemoteRepository.dart';

class SellCurrency {
  SellCurrency({ required this.localRepository});

  final LocalRepository localRepository;

  Future<Currency> call(Currency currency, double amount) {
    var updatedCurrency = localRepository.sellCurrency(currency, amount);

    return updatedCurrency;
  }
}