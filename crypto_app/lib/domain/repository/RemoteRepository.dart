import 'package:crypto_app/data/datasource/remote/CryptoApi.dart';
import 'package:crypto_app/domain/model/ExchangeRate.dart';

import '../../data/datasource/remote/dto/ExchangeRateDto.dart';
import '../../data/repository/ICryptoRepository.dart';
import '../model/Currency.dart';

class RemoteRepository implements ICryptoRepository{

  RemoteRepository({required this.api});
  final CryptoApi api;


  @override
  Future<List<Currency>> getCurrencies() async {
    var items = await api.fetchCurrencies();
    return items.body!.map((e) => Currency.fromCurrencyDto(e)).toList();
    //return items.body!.data?.map((e) => e.toCurrency()).toList();
  }

  Future<ExchangeRate> getExchangeRate(String cryptoCode) async{
    var exchangeRate = await api.fetchExchangeRate("$cryptoCode-USD");
    return ExchangeRate.fromExchangeRateDto(exchangeRate.body!);
  }
}