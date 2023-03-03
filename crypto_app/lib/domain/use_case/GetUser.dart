import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

import '../model/User.dart';

class GetUser {

  GetUser({required this.localRepository});
  final LocalRepository localRepository;


  User call() {
    return localRepository.getUser();
  }

}
