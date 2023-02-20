import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:crypto_app/data/dto/CurrencyDto.dart';
import 'package:crypto_app/data/endpoint/Endpoint.dart';

import '../dto/CurrencyList.dart';
part 'CryptoApi.chopper.dart';


@ChopperApi()
abstract class CryptoApi extends ChopperService {

  static CryptoApi create([ChopperClient? client]) {

    return _$CryptoApi(client);
  }

  @Get(path: Endpoint.CURRENCIES, headers: {"Content-Type": "application/json"})
  Future<Response<CurrencyList>> fetchCurrencies();

}
