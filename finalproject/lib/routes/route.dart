
import 'package:finalproject/pages/addpengeluaranscreen.dart';
import 'package:finalproject/pages/daftarscreen.dart';
import 'package:finalproject/pages/loginaccount.dart';
import 'package:finalproject/pages/loginscreen.dart';
import 'package:finalproject/pages/mainscreen.dart';
import 'package:finalproject/pages/menuaccountscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings rs){
    switch(rs.name){
      case '/daftar':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/loginacc':
        return MaterialPageRoute(builder: (_)=> AccountLoginScreen());
      case '/daftaracc':
        return MaterialPageRoute(builder: (_)=> DaftarScreen());
      case '/akunmenu':
        return MaterialPageRoute(builder: (_)=> MenuAccount());
      case '/addpengeluaran':
        return MaterialPageRoute(builder: (_)=> AddPengeluaranScreen());
      default:
        return MaterialPageRoute(builder: (_)=> LoginScreen());
    }
  }
}