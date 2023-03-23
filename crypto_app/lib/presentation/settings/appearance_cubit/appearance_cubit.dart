import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetTheme.dart';
import 'package:crypto_app/domain/use_case/SetTheme.dart';
import 'package:crypto_app/presentation/Constant.dart';

import 'package:get/get.dart';

class AppearanceCubit extends Cubit<bool> {
  AppearanceCubit() : super(Get.find<GetTheme>().call());



  changeTheme(bool isDark) {
    if (isDark) {
      log("changed to dark theme");
      Get.changeTheme(Constant.darkTheme);
    } else {
      log("changed to light theme");
      Get.changeTheme(Constant.lightTheme);
    }
    Get.find<SetTheme>().call(isDark);
    emit(isDark);
  }


}
