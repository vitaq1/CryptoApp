
import 'dart:developer';

import 'package:crypto_app/domain/repository/LocalRepository.dart';

import '../repository/RemoteRepository.dart';

class UpdateExchangeRates {

  UpdateExchangeRates({required this.remoteRepository, required this.localRepository});
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;


   call() async{
     var currencies = localRepository.getCurrencies();
     currencies.forEach((element) async {
       var exchangeRate = await remoteRepository.getExchangeRate(element.code);
       await localRepository.updateExchangeForCurrency(element, exchangeRate.amount);
     });
   }

}