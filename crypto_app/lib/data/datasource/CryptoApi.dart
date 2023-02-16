import 'dart:convert';

import 'package:crypto_app/data/dto/CurrencyDto.dart';
import 'package:crypto_app/data/endpoint/Endpoint.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  Future<List<CurrencyDto>> fetchCurrencies() async {
    final response = await http.get(Uri.parse(Endpoint.CURRENCIES));
    final List<CurrencyDto> list;
    if (response.statusCode == 200) {
      list = json
          .decode(response.body)
          .map((data) => CurrencyDto.fromJson(data))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load currency');
    }
  }
}
