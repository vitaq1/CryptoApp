import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/AccountView.dart';
import 'package:crypto_app/presentation/settings/SettingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();

}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;


  static final List<Widget> _widgets = <Widget>[
    AccountView(),
    SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Constant.kPurpleColor,
        unselectedItemColor: Theme.of(context).textTheme.headlineLarge!.color,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        //iconSize: ,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/account.svg", color: Theme.of(context).textTheme.headlineLarge!.color,),
            activeIcon: SvgPicture.asset("assets/icons/account.svg",color: Constant.kPurpleColor,),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/settings.svg",color: Theme.of(context).textTheme.headlineLarge!.color,),
              activeIcon: SvgPicture.asset("assets/icons/settings.svg",color: Constant.kPurpleColor,),
              label: ""
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }


}