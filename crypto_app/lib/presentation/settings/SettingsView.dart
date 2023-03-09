import 'dart:developer';

import 'package:crypto_app/presentation/settings/appearance_cubit/appearance_cubit.dart';
import 'package:crypto_app/presentation/settings/edit_account_view.dart';
import 'package:crypto_app/presentation/settings/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../domain/model/User.dart';
import '../Constant.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 75,
        toolbarHeight: 90,
        elevation: 0,
        leading: BlocBuilder<UserCubit, User>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20),
              child:
                  CircleAvatar(backgroundImage: NetworkImage(state.avatarUrl)),
            );
          },
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
        SettingsCard(
            settingName: "Account",
            settingIcon: Icons.account_circle_rounded,
            onPressedCallBack: () {
              Get.to(EditAccountView());
            }),
        SettingsCard(
            settingName: "Notifications",
            settingIcon: Icons.notifications,
            onPressedCallBack: () {}),
        AppearanceCard(onPressedCallBack: () {}),
        SettingsCard(
            settingName: "Privacy & Security",
            settingIcon: Icons.lock_open_sharp,
            onPressedCallBack: () {}),
        SettingsCard(
            settingName: "Help and Support",
            settingIcon: Icons.headphones,
            onPressedCallBack: () {}),
        SettingsCard(
            settingName: "About",
            settingIcon: Icons.question_mark,
            onPressedCallBack: () {}),
        LogoutCard(onPressedCallBack: () {})
      ]),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String settingName;
  final IconData settingIcon;
  final VoidCallback onPressedCallBack;

  const SettingsCard(
      {super.key,
      required this.settingName,
      required this.settingIcon,
      required this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: ElevatedButton(
          onPressed: onPressedCallBack,
          style: ElevatedButton.styleFrom(backgroundColor: Constant.kGrayColor),
          child: ListTile(
            title: Text(
              settingName,
              style: const TextStyle(color: Colors.white),
            ),
            leading: Icon(
              settingIcon,
              color: Colors.white,
            ),
            trailing: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {},
            ),
          )),
    );
  }
}

class AppearanceCard extends StatelessWidget {
  final VoidCallback onPressedCallBack;

  final appearanceCubit = AppearanceCubit();

  AppearanceCard({super.key, required this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value : appearanceCubit,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
        child: ElevatedButton(
            onPressed: onPressedCallBack,
            style:
                ElevatedButton.styleFrom(backgroundColor: Constant.kGrayColor),
            child: ListTile(
              title: const Text(
                "Dark mode",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
              trailing: BlocBuilder<AppearanceCubit, bool>(
                builder: (context, state) {
                  return Switch(
                    value: state,
                    onChanged: (bool value) {
                      context.read<AppearanceCubit>().changeTheme(value);
                    },
                  );
                },
              ),
            )),
      ),
    );
  }
}

class LogoutCard extends StatelessWidget {
  final VoidCallback onPressedCallBack;

  const LogoutCard({super.key, required this.onPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: ElevatedButton(
          onPressed: onPressedCallBack,
          style: ElevatedButton.styleFrom(backgroundColor: Constant.kGrayColor),
          child: const ListTile(
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
