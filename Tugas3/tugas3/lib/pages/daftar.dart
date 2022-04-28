import 'package:flutter/material.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({ Key? key }) : super(key: key);

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 20,),
      child: SingleChildScrollView(child: Center(
        child: Column(children: [
        Text("Daftar",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 150,
          child: Image.asset('assets/img/Logo.png'),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(width: 3,color: Colors.grey)),
            hintText: "Nama",
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0),
            borderRadius: BorderRadius.circular(13)),
          ),
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
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
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),
            borderSide: BorderSide(width: 3,color: Colors.grey)),
            hintText: "Password",
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0),
            borderRadius: BorderRadius.circular(13)),
          ),
          style: TextStyle(fontSize: 20),
          obscureText: true,
        ),
        SizedBox(height: 15,),
        ElevatedButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(children: [
                  Icon(Icons.thumb_up_alt,color: Colors.white,),
                  SizedBox(width: 20,),
                  Text("Daftar berhasil!",style: TextStyle(fontSize: 20),)
                ]),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: 500),
              )
            );
          }, 
          child: Padding(padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Text("Daftar",
          style: TextStyle(fontSize: 20),
          ),
          ),style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[400])
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sudah punya akun?"),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Login",style: TextStyle(color: Colors.green[300], fontWeight: FontWeight.bold),)
            )
          ],
        )
      ]),
      ),
      )
    )
    );
  }
}