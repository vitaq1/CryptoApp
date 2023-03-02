import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 75,
        toolbarHeight: 90,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20),
          child: Image.asset("assets/images/man.png"),
        ),
        title: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              iconSize: 35,
              onPressed: () {},
              icon: const Icon(Icons.settings),
            )),
      ),
      body: ListView(children: [
        SettingsCard(settingName: "Account", settingIcon: Icons.account_circle_rounded,),
        SettingsCard(settingName: "Notifications", settingIcon: Icons.notifications,),
        SettingsCard(settingName: "Appearance", settingIcon: Icons.remove_red_eye_outlined,),
        SettingsCard(settingName: "Privacy & Security", settingIcon: Icons.lock_open_sharp,),
        SettingsCard(settingName: "Help and Support", settingIcon: Icons.headphones,),
        SettingsCard(settingName: "About", settingIcon: Icons.question_mark,),
        LogoutCard()
      ]),
    );
  }
}

class SettingsCard extends StatelessWidget {

  final String settingName;
  final IconData settingIcon;


  const SettingsCard({
    super.key,
    required this.settingName,
    required this.settingIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Constant.kGrayColor),
          child: ListTile(
            title: Text(
              settingName,
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              settingIcon,
              color: Colors.white,
            ),
            trailing: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {},
            ),
          )),
    );
  }
}

class LogoutCard extends StatelessWidget {

  const LogoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Constant.kGrayColor),
          child: ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.redAccent),
            ),
            leading: Icon(
              Icons.logout_rounded,
              color: Colors.redAccent,
            ),

          )),
    );
  }
}


