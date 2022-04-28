import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            Text("Login",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
        SizedBox(height: 20,),
        Container(
          height: 150,
          child: Image.asset("assets/img/Logo.png"),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(width: 3,color: Colors.grey)),
            hintText: "Email",
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0),
            borderRadius: BorderRadius.circular(13)),
          ),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10,),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(width: 3,color: Colors.grey)),
            hintText: "Password",
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0),
            borderRadius: BorderRadius.circular(13)),
          ),obscureText: true,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/mainpage');
          }, 
          child: Padding(padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Text("Login",
          style: TextStyle(fontSize: 20),
          ),
          ),style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[400])
          ),
        ),
        SizedBox(height: 5,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tidak punya akun? "),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, "/daftar");
              },
              child: Text("Daftar",style: TextStyle(color: Colors.green[300], fontWeight: FontWeight.bold),)
            )
          ],
        ),
        )
      ]),
        )
      )
      )
    );
  }
}