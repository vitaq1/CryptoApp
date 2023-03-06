import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

import '../model/User.dart';

class SetTheme {

  SetTheme({required this.localRepository});
  final LocalRepository localRepository;


  call(bool isDark) async {
    localRepository.setDarkTheme(isDark);
  }

}
