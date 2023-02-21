import 'package:crypto_app/data/datasource/remote/dto/ExchangeRateDto.dart';

import '../repository/RemoteRepository.dart';

class GetExchangeRate {

  GetExchangeRate({required this.repository});
  final RemoteRepository repository;


  Future<ExchangeRateDto> call(String cryptoCode){

    return repository.getExchangeRate(cryptoCode);
  }

}