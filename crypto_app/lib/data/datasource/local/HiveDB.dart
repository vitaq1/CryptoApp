import 'dart:developer';

import 'package:crypto_app/data/datasource/local/entity/CurrencyEntity/CurrencyEntity.dart';
import 'package:crypto_app/domain/model/Currency.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../domain/model/User.dart';
import 'entity/UserEntity/UserEntity.dart';

class HiveDB{

  var currencyTable =  Hive.box<CurrencyEntity>("CurrencyTable");
  var userTable =  Hive.box<UserEntity>("UserTable");

  static initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyEntityAdapter());
    Hive.registerAdapter(UserEntityAdapter());
    await Hive.openBox<CurrencyEntity>("CurrencyTable");
    var userTable = await Hive.openBox<UserEntity>("UserTable");
    if (userTable.isEmpty) {
      log("No user yet");
      log("Creating a user...");
      userTable.add(User(name: "Ryan", lastName: "Gosling",location: "Minsk, Belarus",avatarUrl: "https://upload.wikimedia.org/wikipedia/commons/f/f6/Ryan_Gosling_in_2018.jpg").toUserEntity());
    }

    /*if(Hive.box("CurrencyTable").isNotEmpty) {
      var cur1 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(0);
      var cur2 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(1);
      var cur3 = Hive.box<CurrencyEntity>("CurrencyTable").getAt(2);
      cur1!.amount = 0.25;
      cur2!.amount = 2.23;
      cur3!.amount = 2.26;
      Hive.box<CurrencyEntity>("CurrencyTable").putAt(0, cur1);
      Hive.box<CurrencyEntity>("CurrencyTable").putAt(1, cur2);
      Hive.box<CurrencyEntity>("CurrencyTable").putAt(2, cur3);
    }*/}

  static saveData(){
    Hive.close();
  }

}