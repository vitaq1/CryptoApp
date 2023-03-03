import 'package:crypto_app/domain/model/Currency.dart';
import 'package:crypto_app/domain/repository/LocalRepository.dart';

import '../model/User.dart';

class UpdateUser {

  UpdateUser({required this.localRepository});
  final LocalRepository localRepository;


  call(User user) {
    return localRepository.updateUser(user);
  }

}
