import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

class GetAllCurrencies {

  GetAllCurrencies({required this.repository});
  final LocalRepository repository;


  List<Currency> call(){

    return repository.getCurrencies();
  }

}
