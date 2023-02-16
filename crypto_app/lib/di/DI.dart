import 'package:crypto_app/data/datasource/CryptoApi.dart';
import 'package:crypto_app/domain/repository/CryptoRepository.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DI {

  static init() {
    Get.put(CryptoApi());
    Get.put(CryptoRepositoryImpl(api: Get.find()));
    Get.put(GetAllCurrencies(repository: Get.find()));
    Get.put(MainController());
  }

}
