import 'package:finalproject/model/dummypengeluaran.dart';
import 'package:finalproject/model/laporan.dart';
import 'package:finalproject/model/pengeluaran.dart';
import 'package:flutter/material.dart';

class UnduhLaporanScreen extends StatefulWidget {
  
  late List<Laporan> DataDummyPengeluaran = List.empty(growable: true);

  UnduhLaporanScreen(
    {
      Key? key,
      required this.DataDummyPengeluaran
    }
  ):super(key: key);


  @override
  State<UnduhLaporanScreen> createState() => _UnduhLaporanScreenState();
}

class _UnduhLaporanScreenState extends State<UnduhLaporanScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
        child: Column(children: [
          Center(
            child: Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data Laporan",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 30, fontFamily: 'Koulen'),),
          ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.DataDummyPengeluaran.length,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Fitur Belum tersedia",), backgroundColor: Colors.greenAccent[300],duration: Duration(milliseconds: 700),)
                    );
                  },
                  child: itemLaporan(widget.DataDummyPengeluaran[index]),
                );
              },
            ),
          )
        ],)
      ),
    );
  }

  Widget itemLaporan(Laporan laporan){
    return Container(
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            children: [
              Image.asset('assets/logo/documents.png', width: 80,height: 80,),
              SizedBox(width: 10,),
              Container(
                height: 100,
                child: Column(
                  children: [
                    Text(laporan.Judul, textAlign: TextAlign.left ,style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: laporan.Judul.length>15? 15 : 30
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: 250,
                      height: 55,
                      child: Text(laporan.Deskripsi,style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontSize: 12
                    ),),
                    )
                  ],
                ),

              )
            ],
          )
        )
      )
    );
  }
}