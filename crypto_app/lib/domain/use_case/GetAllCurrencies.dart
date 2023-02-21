import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';

class GetAllCurrencies {

  GetAllCurrencies({required this.repository});
  final RemoteRepository repository;


  Future<List<Currency>> call(){

    return repository.getCurrencies();
  }

}
