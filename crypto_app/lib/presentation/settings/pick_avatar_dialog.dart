import 'dart:ui';

import 'package:crypto_app/presentation/settings/user_cubit/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constant.dart';

class PickAvatarDialog extends StatelessWidget {
  final urlController = TextEditingController();

  PickAvatarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: CupertinoColors.darkBackgroundGray,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: SizedBox(
            height: 200,
            width: 270,
            //decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Paste Image URL",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: urlController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: "example: https://host/image.jpg",
                            hintStyle: TextStyle(
                                fontSize: 12, color: Constant.kLightGrayColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constant.kLightGrayColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constant.kLightGrayColor),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Constant.kLightGrayColor),
                          ),),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<UserCubit>().updateAvatar(urlController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const SizedBox(
                            width: 100,
                            child: Text(
                              "SAVE",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
