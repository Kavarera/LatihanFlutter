import 'package:flutter/material.dart';

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class AccountLoginScreen extends StatefulWidget {
  const AccountLoginScreen({ Key? key }) : super(key: key);

  @override
  State<AccountLoginScreen> createState() => _AccountLoginScreenState();
}

class _AccountLoginScreenState extends State<AccountLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(231, 140, 232, 0.5),
          Color.fromRGBO(36, 140, 232, 1)
        ])
        ),

        child: Container(
          margin: EdgeInsets.fromLTRB(20, 40, 20, 5),
          child: ListView(
            addAutomaticKeepAlives: false,
            children: [
              _usernameTextInput(),
              SizedBox(height: 20,),
              _passwordTextInput(),
              SizedBox(height: 50,),
              _confirmButton()

            ],
          )
        ),
      ),
    );
  }

  Widget _confirmButton(){
    return ElevatedButton(onPressed: (){
      if(_usernameController.text.isEmpty || _passwordController.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(
            children: [
              Icon(Icons.error, color: Colors.red, size: 40,),
              SizedBox(width: 10,),
              Text("Username/Password kosong!",style: TextStyle(
                color: Colors.black, fontSize: 15
              ),)
            ],
          ),
          duration: Duration(milliseconds: 700),
          backgroundColor: Colors.white,
          )
        );
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green[600]),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ))
    ),
     child: Padding(
       padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
       child: Text("LOGIN",
       style: TextStyle(
         letterSpacing: 3,
         fontFamily: 'Koulen',
         fontSize: 40
       ),
       ),
     )
     );
  }

  Widget _usernameTextInput(){
    return TextField(
      controller: _usernameController,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(fontSize: 20,fontFamily: 'Righteous',
         fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black, width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.white, width: 3))
      )
    );
  }

  Widget _passwordTextInput(){
    return TextField(
      controller: _passwordController,
      textAlign: TextAlign.center,
      obscureText: true,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(fontSize: 20,fontFamily: 'Righteous',
         fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black, width: 2)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.white, width: 3))
      )
    );
  }

}