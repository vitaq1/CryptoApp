import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity.dart';
import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';

class Currency {
  Currency({
    required this.code,
    required this.name,
    required this.color,
    required this.sortIndex,
  });
  Currency.fromAll({
    required this.code,
    required this.name,
    required this.color,
    required this.sortIndex,
    required exchangeRate,
    required amount,
  });

  late String code;
  late String name;
  late String color;
  late int sortIndex;

  double exchangeRate = 0.0;
  double amount = 0.0;

  dynamic key;

  Currency.fromCurrencyDto(CurrencyDto currencyDto) {
    code = currencyDto.code;
    name = currencyDto.name;
    color = currencyDto.color;
    sortIndex = currencyDto.sortIndex;
  }

  Currency.fromCurrencyEntity(CurrencyEntity currencyEntity) {
    code = currencyEntity.code;
    name = currencyEntity.name;
    color = currencyEntity.color;
    sortIndex = currencyEntity.sortIndex;
    exchangeRate = currencyEntity.exchangeRate;
    amount = currencyEntity.amount;
    key = currencyEntity.key;
  }

  CurrencyEntity toCurrencyEntity() {
    return CurrencyEntity()
      ..code = code
      ..name = name
      ..color = color
      ..sortIndex = sortIndex
      ..exchangeRate = exchangeRate
      ..amount = amount;
  }
}
