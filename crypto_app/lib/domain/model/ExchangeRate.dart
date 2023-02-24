import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';

class ExchangeRate {
  ExchangeRate({
    required this.base,
    required this.currency,
    required this.amount,
  });

  late String base;
  late String currency;
  late double amount;


  ExchangeRate.fromExchangeRateDto(ExchangeRateDto exchangeRateDto){
    base =  exchangeRateDto.base;
    currency =  exchangeRateDto.currency;
    amount =  exchangeRateDto.amount;
  }


}