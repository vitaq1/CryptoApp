import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/use_case/GetTheme.dart';
import 'package:crypto_app/domain/use_case/SetTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppearanceCubit extends Cubit<bool> {
  AppearanceCubit() : super(Get.find<GetTheme>().call());

  var lightTheme = ThemeData(fontFamily: "Poppins", colorScheme: const ColorScheme.light().copyWith(background: CupertinoColors.extraLightBackgroundGray,));
  var darkTheme = ThemeData(fontFamily: "Poppins", colorScheme: const ColorScheme.dark().copyWith(background: CupertinoColors.darkBackgroundGray,));

  changeTheme(bool isDark) {
    if (isDark) {
      log("changed to dark theme");
      Get.changeTheme(darkTheme);
    } else {
      log("changed to light theme");
      Get.changeTheme(lightTheme);
    }
    Get.find<SetTheme>().call(isDark);
    emit(isDark);
  }


}
