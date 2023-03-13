
import 'package:chopper/chopper.dart';
import 'package:crypto_app/data/datasource/remote/CryptoApi.dart';
import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';
import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';
import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/model/ExchangeRate.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_test.mocks.dart';

@GenerateMocks([CryptoApi])
void main() {
  var api = MockCryptoApi();

  var remoteRepository = RemoteRepository(api: api);

  test('Проверка fetchCurrencies()', () async {
    when(api.fetchCurrencies()).thenAnswer((realInvocation) => Future.value(
            Response<List<CurrencyDto>>(http.Response("", 200), [
          CurrencyDto(
              code: "CUR1", name: "CUR1", color: "#aaaaaa", sortIndex: 1)
        ])));

    var actual = await remoteRepository.getCurrencies();
    var matcher = await Future.value(
        [Currency(code: "CUR1", name: "CUR1", color: "#aaaaaa", sortIndex: 1)]);

    expect(actual, matcher);
  });

  test('Проверка fetchExchangeRate()', () async {
    when(api.fetchExchangeRate("BTC-USD")).thenAnswer((realInvocation) =>
        Future.value(Response<ExchangeRateDto>(http.Response("", 200),
            ExchangeRateDto(base: "USD", currency: "BTC", amount: 20000))));

    var actual = await remoteRepository.getExchangeRate("BTC");
    var matcher = await Future.value(ExchangeRate(base: "USD", currency: "BTC", amount: 20000, date: DateTime.now()));

    expect(actual, matcher);
  });

  test('Проверка fetchExchangeRateByDate()', () async {
    var date = DateTime.now();
    when(api.fetchExchangeRateByDate("BTC-USD", date.toString())).thenAnswer((realInvocation) =>
        Future.value(Response<ExchangeRateDto>(http.Response("", 200),
            ExchangeRateDto(base: "USD", currency: "BTC", amount: 20000))));

    var actual = await remoteRepository.getExchangeRateByDate("BTC", date.toString());
    var matcher = await Future.value(ExchangeRate(base: "USD", currency: "BTC", amount: 20000, date: date));

    expect(actual, matcher);
  });
}
