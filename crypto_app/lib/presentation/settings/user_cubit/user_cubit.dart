import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/UpdateUser.dart';
import 'package:get/get.dart';

import '../../../domain/model/User.dart';
import '../../../domain/use_case/GetUser.dart';

class UserCubit extends Cubit<User> {

  UserCubit() : super(Get.find<GetUser>().call());



  updateData(String name, String lastName, String location){
    state.name = name;
    state.lastName = lastName;
    state.location = location;
    Get.find<UpdateUser>().call(state);
    emit(state);

  }

  updateAvatar(String newAvatar){
    state.avatarUrl = newAvatar;
    Get.find<UpdateUser>().call(state);
    emit(state);
  }


}
