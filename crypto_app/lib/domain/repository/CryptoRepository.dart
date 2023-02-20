import 'package:crypto_app/data/datasource/CryptoApi.dart';

import '../../data/repository/ICryptoRepository.dart';
import '../model/Currency.dart';

class CryptoRepositoryImpl implements CryptoRepository{

  CryptoRepositoryImpl({required this.api});
  final CryptoApi api;


  @override
  Future<List<Currency>> getCurrencies() async {
    var items = await api.fetchCurrencies();
    print(items.bodyString);
    //return items.body!.map((item) => item.toCurrency()).toList();
    return items.body!.data.map((e) => e.toCurrency()).toList();
  }

}