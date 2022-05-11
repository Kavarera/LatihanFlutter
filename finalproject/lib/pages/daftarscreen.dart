import 'package:flutter/material.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({ Key? key }) : super(key: key);

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft,
          colors: [
            Color.fromRGBO(189, 140, 232, 1),
            Color.fromRGBO(15, 200, 89, 1)
          ])
        ),
      
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 5),

        child: ListView(
          addAutomaticKeepAlives: false,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _emailTextInput(),
            SizedBox(height: 20,),
            _usernameTextInput(),
            SizedBox(height: 20,),
            _passwordTextInput(),
            SizedBox(height: 20,),
            _confirmButton()
          ],
        ),

      )
      )
    );
  }

  Widget _confirmButton(){
    return ElevatedButton(onPressed: (){
      if(_usernameController.text.isEmpty || _passwordController.text.isEmpty || _emailController.text.isEmpty){
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
      if(!_emailController.text.contains('@')){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
            children: [
              Icon(Icons.error, color: Colors.red, size: 40,),
              SizedBox(width: 10,),
              Text("format email salah",style: TextStyle(
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
       child: Text("SIGN UP",
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

  Widget _emailTextInput(){
    return TextField(
      controller: _emailController,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
      decoration: InputDecoration(
        hintText: "Email",
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