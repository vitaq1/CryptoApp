import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDB{

  var currencyTable =  Hive.box<CurrencyEntity>("CurrencyTable");

  static initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyEntityAdapter());
    await Hive.openBox<CurrencyEntity>("CurrencyTable");
  }

  static saveData(){
    Hive.close();
  }

}