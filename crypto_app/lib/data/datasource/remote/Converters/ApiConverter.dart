import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';
import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';


class ApiConverter implements Converter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    var body = response.body;

    if (isTypeOf<BodyType, List<CurrencyDto>>()) {
      List<dynamic> currencyList = json.decode(response.body)['data'];
      body = currencyList.map((e) => CurrencyDto.fromJson(e)).toList();
    }
    else if(isTypeOf<BodyType, ExchangeRateDto>()) {
      Map<String, dynamic> currentExchange = json.decode(response.body)['data'];
      body = ExchangeRateDto.fromJson(currentExchange);
    }

    return response.copyWith<BodyType>(body: body);
  }

  @override
  Request convertRequest(Request request) {
    var body = request.body;
    return request.copyWith(body: body);
  }

}