import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';
import 'package:crypto_app/domain/model/ExchangeRate.dart';

import '../repository/RemoteRepository.dart';

class GetExchangeRate {

  GetExchangeRate({required this.repository});
  final RemoteRepository repository;


  Future<ExchangeRate> call(String cryptoCode){

    return repository.getExchangeRate(cryptoCode);
  }

}