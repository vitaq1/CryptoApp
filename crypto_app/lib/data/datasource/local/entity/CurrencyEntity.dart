import 'dart:developer';

import 'package:hive/hive.dart';
part 'CurrencyEntity.g.dart';

@HiveType(typeId: 0)
class CurrencyEntity extends HiveObject {

  @HiveField(0)
  late String code;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String color;

  @HiveField(3)
  late int sortIndex;

  @HiveField(4)
  late double exchangeRate;

  @HiveField(5)
  double amount = 0.0;

}