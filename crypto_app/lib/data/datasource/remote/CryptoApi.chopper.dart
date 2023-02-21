// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CryptoApi.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CryptoApi extends CryptoApi {
  _$CryptoApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CryptoApi;

  @override
  Future<Response<List<CurrencyDto>>> fetchCurrencies() {
    final Uri $url = Uri.parse('https://api.coinbase.com/v2/currencies/crypto');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<CurrencyDto>, CurrencyDto>($request);
  }

  @override
  Future<Response<ExchangeRateDto>> fetchExchangeRate(String currencyPair) {
    final Uri $url =
        Uri.parse('https://api.coinbase.com/v2/prices/${currencyPair}/spot');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ExchangeRateDto, ExchangeRateDto>($request);
  }
}
