import 'dart:developer';

import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';

class SaveCurrenciesLocally {

  SaveCurrenciesLocally({required this.remoteRepository, required this.localRepository});
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;


   call() async{

     var currencies = (await remoteRepository.getCurrencies()).where((element) => element.sortIndex < 120).toList();
     currencies.forEach((element) {log(element.sortIndex.toString());});
     localRepository.addCurrencies(currencies);
  }

}
