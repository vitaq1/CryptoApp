import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity.dart';
import 'package:crypto_app/domain/model/Currency.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDB{

  var currencyTable =  Hive.box<CurrencyEntity>("CurrencyTable");

  static initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyEntityAdapter());
    await Hive.openBox<CurrencyEntity>("CurrencyTable");

   /* var cur1 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(0);
    var cur2 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(1);
    var cur3 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(2);
    cur1!.amount = 0.25;
    cur2!.amount = 2.23;
    cur3!.amount = 2.26;
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(0, cur1);
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(1, cur2);
    Hive.box<CurrencyEntity>("CurrencyTable").putAt(2, cur3);*/
  }

  static saveData(){
    Hive.close();
  }

}