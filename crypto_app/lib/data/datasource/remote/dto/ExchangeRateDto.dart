
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ExchangeRateDto {

  late String base;
  late String currency;
  late double amount;


  ExchangeRateDto({
    required this.base,
    required this.currency,
    required this.amount,
  });

  ExchangeRateDto.fromJson(dynamic json) {
    base = json['base'];
    currency = json['currency'];
    amount = double.parse(json['amount']);
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base'] = base;
    map['currency'] = currency;
    map['amount'] = amount;

    return map;
  }



}