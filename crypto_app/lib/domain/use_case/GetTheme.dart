import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

import '../model/User.dart';

class GetTheme {

  GetTheme({required this.localRepository});
  final LocalRepository localRepository;


  bool call() {
    return localRepository.isDarkTheme();
  }

}
