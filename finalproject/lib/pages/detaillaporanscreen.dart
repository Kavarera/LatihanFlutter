import 'package:finalproject/model/laporan.dart';
import 'package:flutter/material.dart';

class DetailLaporanScreen extends StatelessWidget {
  const DetailLaporanScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text("Detail Laporan",
                style: TextStyle(fontFamily: 'Koulen',
                fontSize: 30),
                ),
              ),
            ),
            itemPengeluaran()
          ],
        ),
      ),

    );
  }

  Widget itemPengeluaran(){
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
              Image.asset('assets/logo/money.png',width: 80,height: 80,),
              SizedBox(width: 5,),
              Container(
                height: 150,
                child: Column(
                  children: [
                    Text("Judul P", textAlign: TextAlign.left ,style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 30
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: 250,
                      height: 55,
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Deskripsi P",style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontSize: 12
                    ),),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text("Rp. -5000",style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.red,
                      fontSize: 28,
                      )
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