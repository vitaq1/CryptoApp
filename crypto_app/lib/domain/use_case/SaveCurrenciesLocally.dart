import 'package:crypto_app/domain/repository/LocalRepository.dart';
import 'package:crypto_app/domain/repository/RemoteRepository.dart';

class SaveCurrenciesLocally {

  SaveCurrenciesLocally({required this.remoteRepository, required this.localRepository});
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;



   call() async{

     var currencies = (await remoteRepository.getCurrencies()).where((element) => element.sortIndex < 120).toList();
     await localRepository.addCurrencies(currencies);

  }


}
