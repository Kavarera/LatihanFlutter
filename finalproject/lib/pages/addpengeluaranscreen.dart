import 'dart:ffi';

import 'package:finalproject/model/dummypengeluaran.dart';
import 'package:finalproject/model/pengeluaran.dart';
import 'package:finalproject/model/user.dart';
import 'package:finalproject/pages/unduhlaporanscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPengeluaranScreen extends StatefulWidget {
  const AddPengeluaranScreen({ Key? key }) : super(key: key);

  @override
  State<AddPengeluaranScreen> createState() => _AddPengeluaranScreenState();
}

class _AddPengeluaranScreenState extends State<AddPengeluaranScreen> {
  TextEditingController _judulController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();


  bool _pressedOnce=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(113, 197, 169, 1),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 40, 10, 5),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
                child: Text("Tambah data pengeluaran",
                style: TextStyle(fontSize: 25, fontFamily: 'Koulen'),
                ),
              ),
              SizedBox(height: 20,),
              _judulTextField(),
              SizedBox(height: 20,),
              _deskripsiTextField(),
              SizedBox(height: 20,),
              Center(child: Text("Pengeluaran",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Koulen'
              ),
              ),),
            Row(
              children: [
              Container(
                margin: EdgeInsets.only(left: 100),
                child: Text("Rp. ", style: TextStyle(
                fontSize: 25,
                fontFamily: 'Koulen'
              ),),
              ),
              SizedBox(width: 20,),
              Container(
                width: 100,
                child: TextField(
                  controller: _jumlahController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right,
                  onSubmitted: (temp){
                    _jumlahController.text = _jumlahController.text.replaceAll(' ', '');
                    _jumlahController.text= _jumlahController.text.replaceAll('-', '');
                    _jumlahController.text= _jumlahController.text.replaceAll(',', '');
                    _jumlahController.text= _jumlahController.text.replaceAll('.', '');
                  },
                  decoration: InputDecoration(
                    hintText: "0000",
                  ),
                ),
              )
            ],)
            ,
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: ElevatedButton(onPressed: (){


                if(!_judulController.text.isEmpty && !_jumlahController.text.isEmpty){
                  User.AddPengeluaranTemporary(new Pengeluaran(_judulController.text, "added from another activity", int.parse(_jumlahController.text), new DateTime.now().toString()));
                  Navigator.pop(context);
                }


              }, child: Text("Tambah",
              style: TextStyle(
                fontFamily: 'Koulen',
                fontSize: 30
              ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              )
            )

          ],
        ),
      ),
    );
  }

  bool _validateJudul(String _judul, bool pressed){
    if(_judul.isEmpty && pressed){
      return true;
    }
    return false;
  }

  Widget _deskripsiTextField(){
    return TextField(
      controller: _deskripsiController,
      decoration: InputDecoration(
        hintText: "Deskripsi Pengeluaran",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black,width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3
          )
        )
      ),
    );
  }

  Widget _judulTextField(){
    return TextField(
      controller: _judulController,
      decoration: InputDecoration(
        hintText: "Judul Pengeluaran",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black,width: 2)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red, width: 2)
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red,width: 2)
        ),
        errorText: _validateJudul(_judulController.text,_pressedOnce) ? "Bagian ini harus diisi!" : null
      ),
    );
  }
}