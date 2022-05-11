
import 'package:finalproject/pages/loginscreen.dart';
import 'package:finalproject/pages/mainscreen.dart';
import 'package:finalproject/pages/menuaccountscreen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({ Key? key }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  
  int _currentIndex=0;

  final _Tabs=[
    MenuAccount(),
    LoginScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(113, 79, 255, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromRGBO(113, 197, 169, 1),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.white,size: 30,),
            label: "Akun",
            backgroundColor: Colors.white
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money,color: Colors.white,size: 30,),
            label: "Pengeluaran"
            )
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
      body: _Tabs[_currentIndex]
    );
  }
}