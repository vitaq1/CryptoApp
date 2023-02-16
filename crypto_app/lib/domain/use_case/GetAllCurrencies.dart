import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/CryptoRepository.dart';

class GetAllCurrencies {

  GetAllCurrencies({required this.repository});
  final CryptoRepositoryImpl repository;


  Future<List<Currency>> call(){

    return repository.getCurrencies();
  }

}
