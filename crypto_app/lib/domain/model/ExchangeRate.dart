import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';

class ExchangeRate {
  ExchangeRate({
    required this.base,
    required this.currency,
    required this.amount,
    required this.date,
  });

  late String base;
  late String currency;
  late double amount;
  late DateTime date;


  ExchangeRate.fromExchangeRateDto(ExchangeRateDto exchangeRateDto, String date){
    base =  exchangeRateDto.base;
    currency =  exchangeRateDto.currency;
    amount =  exchangeRateDto.amount;
    this.date = DateTime.parse(date);
  }

}