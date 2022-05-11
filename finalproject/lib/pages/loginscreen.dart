import 'package:finalproject/pages/mainscreen.dart';
import 'package:flutter/material.dart';

TextEditingController _namaController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(189, 140, 232, 1),
              Color.fromRGBO(15, 200, 89, 1)
            ]
          )
        ),
        //main
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Column(
          children: [
            Center(
              child: Text("NGITUNG",
              style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 40
              ),
              ),
            ),
            SizedBox(height: 60),
            Text("Masukan nama panggilan kamu",
            style: TextStyle(
              fontFamily: 'Inconsolata',
              fontWeight: FontWeight.w100,
              fontSize: 30,
            ), textAlign: TextAlign.center,),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.black,width: 3)
                ),
                hintText: "Nama Panggilan",
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),
                borderRadius: BorderRadius.circular(12.0)),
              ),
              style: TextStyle(fontSize: 20),
              controller: _namaController,
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){
              if(_namaController.text.isNotEmpty){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(nama: _namaController.text)));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(
                    "Input tidak boleh kosong!",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ))
                );
              }
            }, 
            child: Padding(padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Text("MULAI",
            style: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 25,
              color: Colors.white
            ),
            ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(113, 140, 232, 1))
            ),
            )
          ],
        ),
        ),
      ),
    );
  }
}