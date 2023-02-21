import '../../domain/model/Currency.dart';

abstract class ICryptoRepository{

  Future<List<Currency>> getCurrencies();

}