import 'package:flutter/material.dart';
import 'package:tugas3/pages/daftar.dart';
import 'package:tugas3/pages/login.dart';
import 'package:tugas3/pages/mainpage.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings rs){
    switch(rs.name){
      case '/daftar':
        return MaterialPageRoute(builder: (_) => DaftarScreen());

      case '/mainpage':
        return MaterialPageRoute(builder: (_)=> MainPage());
      default:
        return MaterialPageRoute(builder: (_)=>LoginScreen());

    }
  }
}