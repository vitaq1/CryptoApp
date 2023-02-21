import '../../data/datasource/local/HiveDB.dart';
import '../../data/repository/ICryptoRepository.dart';
import '../model/Currency.dart';

class LocalRepository implements ICryptoRepository{

  LocalRepository({required this.db});
  final HiveDB db;


  @override
  Future<List<Currency>> getCurrencies() async {
    return List<Currency>.empty();
  }
}