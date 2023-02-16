import 'package:crypto_app/presentation/main/MainController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradingView extends StatelessWidget {
  final MainController c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("trading")));
  }
}