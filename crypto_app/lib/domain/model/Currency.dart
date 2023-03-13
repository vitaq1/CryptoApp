import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity/CurrencyEntity.dart';
import 'package:crypto_app/data/datasource/remote/dto/CurrencyDto.dart';
import 'package:equatable/equatable.dart';

class Currency extends Equatable{
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
    required this.exchangeRates,
    required this.amount,
  });

  late String code;
  late String name;
  late String color;
  late int sortIndex;

  List<double> exchangeRates = List.empty();
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
    exchangeRates = currencyEntity.exchangeRates;
    amount = currencyEntity.amount;
    key = currencyEntity.key;
  }

  CurrencyEntity toCurrencyEntity() {
    return CurrencyEntity()
      ..code = code
      ..name = name
      ..color = color
      ..sortIndex = sortIndex
      ..exchangeRates = exchangeRates
      ..amount = amount;
  }

  @override
  List<Object?> get props => [code, name, color, sortIndex];
}
