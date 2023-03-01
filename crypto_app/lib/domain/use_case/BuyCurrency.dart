import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

class BuyCurrency {
  BuyCurrency(
      {required this.localRepository});

  final LocalRepository localRepository;

   Future<Currency> call(Currency currency, double amount) {
     var updatedCurrency = localRepository.buyCurrency(currency, amount);

    return updatedCurrency;
  }


}
