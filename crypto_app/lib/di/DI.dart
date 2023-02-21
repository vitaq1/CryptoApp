
import 'package:chopper/chopper.dart' as chop;
import 'package:crypto_app/data/datasource/remote/Converters/ApiConverter.dart';
import 'package:crypto_app/data/datasource/remote/CryptoApi.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';
import 'package:crypto_app/domain/use_case/GetAllCurrencies.dart';
import 'package:crypto_app/domain/use_case/GetExchangeRate.dart';
import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class DI {

  static init() {
    var client = chop.ChopperClient(
      services: [CryptoApi.create()],
      converter: ApiConverter(),
    );
    Get.put(client);
    Get.put(client.getService<CryptoApi>());
    Get.put(RemoteRepository(api: Get.find()));
    Get.put(GetAllCurrencies(repository: Get.find()));
    Get.put(GetExchangeRate(repository: Get.find()));
    Get.put(MainController());
  }

}
