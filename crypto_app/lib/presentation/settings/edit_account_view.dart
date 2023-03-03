import 'package:crypto_app/presentation/settings/bloc/user_cubit.dart';
import 'package:crypto_app/presentation/settings/pick_avatar_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/model/User.dart';
import '../Constant.dart';

class EditAccountView extends StatelessWidget {


  final nameController  = TextEditingController();
  final lastNameController  = TextEditingController();
  final locationController  = TextEditingController();

  EditAccountView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 75,
      toolbarHeight: 75,
      backgroundColor: CupertinoColors.darkBackgroundGray,
      elevation: 0,
      /*
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constant.kGrayColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Icon(
                Icons.add_chart_outlined,
                color: Colors.white54,
                size: 24,
              ),
            ),
          ),
        ),
      ],
      */
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Get.back();
            // Get.to(TradingView(activeHolding: activeHolding));
          },
          style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Constant.kGrayColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, User>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Column(
              children: [
                const Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Edit profile",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                Expanded(
                    flex: 4,
                    child: Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.avatarUrl,
                          ),
                          radius: 90,
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PickAvatarDialog();
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(15),
                                    side: BorderSide(
                                        color: CupertinoColors
                                            .darkBackgroundGray,
                                        width: 5)),
                                child: Icon(Icons.edit),
                              )),
                        ))),
                Expanded(
                    flex: 8,
                    child: ListView(
                      children: [
                        ListTile(
                          title: const Text(
                            "Name",
                            style: TextStyle(
                                color: Constant.kLightGrayColor, fontSize: 12),
                          ),
                          subtitle: TextField(
                            controller: nameController..text = state.name,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Lastname",
                            style: TextStyle(
                                color: Constant.kLightGrayColor, fontSize: 12),
                          ),
                          subtitle: TextField(
                            controller: lastNameController..text = state.lastName,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Location",
                            style: TextStyle(
                                color: Constant.kLightGrayColor, fontSize: 12),
                          ),
                          subtitle: TextField(
                            controller:
                            locationController..text = state.location,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Constant.kLightGrayColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: SizedBox(
                              width: 100,
                              child: Text(
                                "CANCEL",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<UserCubit>().updateData(nameController.text, lastNameController.text, locationController.text);
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
