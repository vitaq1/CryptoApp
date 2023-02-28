import 'package:crypto_app/domain/model/ExchangeRate.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:intl/intl.dart';

import '../model/Currency.dart';
import '../repository/RemoteRepository.dart';

class UpdateExchangeRates {
  UpdateExchangeRates(
      {required this.remoteRepository, required this.localRepository});

  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  Future<List<Currency>> call() async{
    var currencies = localRepository.getCurrencies();
    List<Future<Currency>> futureCurrencies = [];
    var today = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    currencies.forEach((element) async {
      List<Future<ExchangeRate>> rates = [];
      for (int i = 6; i > 0; i--) {
        var dateToFind = today.subtract(Duration(days: i));
        rates.add(remoteRepository.getExchangeRateByDate(
            element.code, formatter.format(dateToFind)));
      }
      rates.add(remoteRepository.getExchangeRate(element.code));
      futureCurrencies.add(getFutureWithRate(element, rates));

    });

    return await Future.wait(futureCurrencies);
  }


  Future<Currency> getFutureWithRate(Currency currency, List<Future<ExchangeRate>> rates) async {
    var r = await Future.wait(rates);
    var c = localRepository.updateExchangeRatesForCurrency(
        currency, r.map((e) => e.amount).toList());
    return c;
  }
}
