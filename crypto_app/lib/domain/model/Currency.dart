import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';

class Currency {
  Currency({
    this.code,
    this.name,
    this.color,
  });

  String? code;
  String? name;
  String? color;

  double? exchangeRate;
  double? amount = 0.0;


  Currency.fromCurrencyDto(CurrencyDto currencyDto){
    code =  currencyDto.code;
    name =  currencyDto.name;
    color =  currencyDto.color;
  }

  /*Currency.fromCurrencyEntity(CurrencyDto currencyDto){
    code =  currencyDto.code;
    name =  currencyDto.name;
    color =  currencyDto.color;
  }*/
}
