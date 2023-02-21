
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';




class ApiConverter implements Converter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    var body = response.body;

    List<dynamic> currencyList = json.decode(response.body)['data'];

    body = currencyList.map((e) => CurrencyDto.fromJson(e)).toList();

    return response.copyWith<BodyType>(body: body);
  }

  @override
  Request convertRequest(Request request) {
    var body = request.body;
    // Convert body to String however you like
    return request.copyWith(body: body);
  }

}