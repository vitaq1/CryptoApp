import 'package:crypto_app/presentation/Constant.dart';
import 'package:crypto_app/presentation/account/AccountView.dart';
import 'package:crypto_app/presentation/trading/TradingView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/datasource/local/HiveDB.dart';
import '../../domain/model/Currency.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();


}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;


  static List<Widget> _widgets = <Widget>[
    AccountView(),
    //TradingView(activeHolding: Currency.fromAll(code: "BTC", name: "Bitcoin", color: "FFF6E22C", sortIndex: 100, exchangeRates : [100,200,300,400,300,200,500], amount: 5)),
    AccountView(),
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
        backgroundColor: Constant.kNavColor,
        selectedItemColor: Constant.kPurpleColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //iconSize: ,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/account.svg"),
            activeIcon: SvgPicture.asset("assets/icons/account.svg",color: Constant.kPurpleColor,),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/settings.svg"),
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