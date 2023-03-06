
import 'package:chopper/chopper.dart' as chop;
import 'package:crypto_app/data/datasource/remote/Converters/ApiConverter.dart';
import 'package:crypto_app/data/datasource/remote/CryptoApi.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';
import 'package:crypto_app/domain/use_case/BuyCurrency.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/GetExchangeRate.dart';
import 'package:crypto_app/domain/use_case/GetTheme.dart';
import 'package:crypto_app/domain/use_case/GetUser.dart';
import 'package:crypto_app/domain/use_case/SaveCurrenciesLocally.dart';
import 'package:crypto_app/domain/use_case/SellCurrency.dart';
import 'package:crypto_app/domain/use_case/SetTheme.dart';
import 'package:crypto_app/domain/use_case/UpdateExchangeRates.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/local/HiveDB.dart';
import '../domain/use_case/UpdateUser.dart';


class DI {

  static init() async {
    var client = chop.ChopperClient(services: [CryptoApi.create()], converter: ApiConverter(),);
    Get.put(client);
    Get.put(client.getService<CryptoApi>());
    Get.put(HiveDB());
    Get.put(RemoteRepository(api: Get.find()));
    Get.put(await SharedPreferences.getInstance());
    Get.put(LocalRepository(db: Get.find(), prefs: Get.find<SharedPreferences>()));
    Get.put(GetAllCurrencies(repository: Get.find()));
    Get.put(GetExchangeRate(repository: Get.find()));
    Get.put(SaveCurrenciesLocally(remoteRepository: Get.find(), localRepository: Get.find()));
    Get.put(UpdateExchangeRates(remoteRepository: Get.find(), localRepository: Get.find()));
    Get.put(BuyCurrency(localRepository: Get.find()));
    Get.put(SellCurrency(localRepository: Get.find()));
    Get.put(GetUser(localRepository: Get.find()));
    Get.put(UpdateUser(localRepository: Get.find()));
    Get.put(GetTheme(localRepository: Get.find()));
    Get.put(SetTheme(localRepository: Get.find()));

  }

}
