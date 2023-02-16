import '../../domain/model/Currency.dart';

abstract class CryptoRepository{

  Future<List<Currency>> getCurrencies();

}