
import 'package:chopper/chopper.dart' as chop;
import 'package:crypto_app/data/datasource/CryptoApi.dart';
import 'package:crypto_app/domain/repository/CryptoRepository.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/endpoint/Endpoint.dart';

class DI {

  static init() {
    var client = chop.ChopperClient(
      baseUrl: Uri(path: Endpoint.BASE),
      services: [CryptoApi.create()],
      converter: const chop.JsonConverter(),
    );
    Get.put(client);
    Get.put(client.getService<CryptoApi>());
    Get.put(CryptoRepositoryImpl(api: Get.find()));
    Get.put(GetAllCurrencies(repository: Get.find()));
    Get.put(MainController());
  }

}
