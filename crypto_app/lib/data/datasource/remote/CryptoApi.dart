import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';
import 'package:crypto_app/data/datasource/remote/endpoint/Endpoint.dart';

import '../../datasource/remote/dto/CurrencyDto.dart';

part 'CryptoApi.chopper.dart';

@ChopperApi()
abstract class CryptoApi extends ChopperService {
  static CryptoApi create([ChopperClient? client]) {
    return _$CryptoApi(client);
  }

  @Get(path: Endpoint.CURRENCIES, headers: {"Content-Type": "application/json"})
  Future<Response<List<CurrencyDto>>> fetchCurrencies();

  @Get(path: Endpoint.EXCHANGE_RATE, headers: {"Content-Type": "application/json"})
  Future<Response<ExchangeRateDto>> fetchExchangeRate(
      @Path("currency_pair") String currencyPair);

}
