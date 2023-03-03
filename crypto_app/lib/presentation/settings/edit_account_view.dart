import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constant.dart';

class EditAccountView extends StatelessWidget {
  const EditAccountView({Key? key}) : super(key: key);

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
                  "https://upload.wikimedia.org/wikipedia/commons/f/f6/Ryan_Gosling_in_2018.jpg",
                ),
                radius: 90,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          side: BorderSide(
                              color: CupertinoColors.darkBackgroundGray,
                              width: 5)),
                      child: Icon(Icons.edit),
                    )),
              ))),
          Expanded(
              flex: 8,
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Name",
                      style: TextStyle(color: Constant.kLightGrayColor,fontSize: 12),
                    ),
                    subtitle: TextField(
                      controller: TextEditingController(text: "Vitaly"),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Lastname",
                      style: TextStyle(color: Constant.kLightGrayColor,fontSize: 12),
                    ),
                    subtitle: TextField(
                      controller: TextEditingController(text: "123"),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Location",
                      style: TextStyle(color: Constant.kLightGrayColor,fontSize: 12),
                    ),
                    subtitle: TextField(
                      controller: TextEditingController(text: "Minsk, Belarus"),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Constant.kLightGrayColor),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                        width: 100,
                        child: Text(
                          "SAVE",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
