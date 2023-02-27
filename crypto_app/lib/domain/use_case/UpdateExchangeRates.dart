import 'dart:developer';

import 'package:crypto_app/domain/model/ExchangeRate.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:intl/intl.dart';

import '../repository/RemoteRepository.dart';

class UpdateExchangeRates {
  UpdateExchangeRates(
      {required this.remoteRepository, required this.localRepository});

  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  call() async {
    var currencies = localRepository.getCurrencies();
    log("currencies to update: ${currencies.length}");
    currencies.forEach((element) async {
      List<Future<ExchangeRate>> rates = [];
      var today = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      for (int i = 13; i > 0; i--) {
        var dateToFind = today.subtract(Duration(days: i));
        rates.add(remoteRepository.getExchangeRateByDate(
            element.code, formatter.format(dateToFind)));
      }
      rates.add(remoteRepository.getExchangeRate(element.code));
      var _rates = await Future.wait(rates,);
      _rates.sort((a, b) => a.date.compareTo(b.date));

      log("rates count for ${element.code}: " + _rates.length.toString());

      await localRepository.updateExchangeRatesForCurrency(
          element, _rates.map((e) => e.amount).toList());
    });
  }
}
