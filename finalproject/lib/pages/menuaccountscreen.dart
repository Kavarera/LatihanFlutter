import 'package:flutter/material.dart';

class MenuAccount extends StatefulWidget {
  const MenuAccount({ Key? key }) : super(key: key);

  @override
  State<MenuAccount> createState() => _MenuAccountState();
}

class _MenuAccountState extends State<MenuAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(231, 140, 232, 0.5),
          Color.fromRGBO(36, 140, 232, 1)
        ])
      ), child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/loginacc');
            },
             child: Padding(
               padding: EdgeInsets.fromLTRB(80, 5, 80, 5),
               child: Text("LOGIN", 
               style: TextStyle(fontFamily: 'Koulen',
                      fontSize: 35,letterSpacing: 5),
               ),
             ),
             style: ButtonStyle(
               shadowColor: MaterialStateProperty.all(Colors.red),
               backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
               foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(40),
                   side: BorderSide(color: Colors.transparent, width: 0)
                 )
               )
             ),
             ),
             SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/daftaracc');
            },
             child: Padding(
               padding: EdgeInsets.fromLTRB(80, 5, 80, 5),
               child: Text("SIGN UP", 
               style: TextStyle(fontFamily: 'Koulen',
                      fontSize: 35,letterSpacing: 5),
               ),
             ),
             style: ButtonStyle(
               shadowColor: MaterialStateProperty.all(Colors.red),
               backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
               foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(40),
                   side: BorderSide(color: Colors.transparent, width: 0)
                 )
               )
             ),
             )
          ],
        ),
      ),
      ),
    );
  }
}