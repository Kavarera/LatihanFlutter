import 'package:finalproject/model/dummypengeluaran.dart';
import 'package:finalproject/model/laporan.dart';
import 'package:finalproject/model/user.dart';
import 'package:finalproject/pages/unduhlaporanscreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String nama;

  MainScreen({
    Key? key,
    required this.nama
  }):super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Container(
        width: 80,
        height: 80,
        child: RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          splashColor: Colors.green,
          fillColor: Colors.blue,
          onPressed: (){
            Navigator.pushNamed(context, '/addpengeluaran');
          },
          child: Icon(Icons.add,color: Colors.white,size: 80,)
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(46, 207, 223, 1),
            Color.fromRGBO(85, 248, 44, 0.5)
          ]
        )),

        child: Container(
        margin: EdgeInsets.fromLTRB(10, 50, 10, 20),
        child: Container(
          child: Column(children: [
              Align(
                alignment: Alignment.topRight,
                child: _textSelamatDatang(widget.nama),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: _textPengunaanBulanan(700000, 22),
              ),
              Expanded(child: GridView.count(crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 5,
              children: <Widget>[
                _cardMenuMain("Upload Laporan","assets/logo/upload.png",1),
                _cardMenuMain("Unduh Laporan","assets/logo/download.png",2),
                _cardMenuMain("Setting","assets/logo/setting.png",3),
                _cardMenuMain("Bagikan Laporan","assets/logo/share.png",4)
                
              ],
              ))
          ]),
        ),
      ),
      )
    );
  }

  Widget _cardMenuMain(String _text, String _photo,int _kode){
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white,width: 0),
        borderRadius: BorderRadius.circular(30)
      ),
          child: InkWell(
            onTap: (){
              switch (_kode) {

                  case 1:
                  DummyPengeluaran.addDummy(new Laporan(new DateTime.now().toString(), "data from "+ new DateTime.now().toString(),User.GetPengeluaranTemporary()));
                  User.ClearPengeluaranTemporary();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Berhasil menambahkan!"), backgroundColor: Colors.green,
                    duration: Duration(milliseconds: 700),)
                  );
                  // DummyPengeluaran.addDummy(user)
                  //entar
                  break;
                  case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UnduhLaporanScreen(DataDummyPengeluaran: DummyPengeluaran.getDummy())));
                  break;
                  case 3:
                  Navigator.pushNamed(context, '/akunmenu');
                  break;
                default:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Fitur belum selesai"),
                    duration: Duration(milliseconds: 700),)
                  );
                  break;
              }
            },
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.green,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(_photo,height: 100,width: 100,),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(_text, textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Koulen',
                    fontSize: 25
                  ),)
                  )
                ],
              ),
            ),
          ),
        );
  }

  Widget _textPengunaanBulanan(int penggunaan, double _fontsize){
    if(penggunaan<=500000){
      return Row(
        children: [
          Text("Penggunaan total\t: Rp. ",
          style: TextStyle(
            fontFamily: 'JuliusSansOne',
            fontSize: _fontsize
          ),),
          Text(penggunaan.toString(),
          style: TextStyle(
            fontSize: _fontsize,
            fontFamily: 'Koulen',
            color: Colors.lightGreen[700]
          ),)
        ]
      );
    }
    else if(penggunaan>500000 && penggunaan<=1000000){
      return Row(
        children: [
          Text("Penggunaan total\t: Rp. ",
          style: TextStyle(
            fontFamily: 'JuliusSansOne',
            fontSize: _fontsize
          ),),
          Text(penggunaan.toString(),
          style: TextStyle(
            fontSize: _fontsize,
            fontFamily: 'Koulen',
            color: Colors.yellow[600]
          ),)
        ]
      );
    }
    else{
      return Row(
        children: [
          Text("Penggunaan total\t: Rp. ",
          style: TextStyle(
            fontFamily: 'JuliusSansOne',
            fontSize: _fontsize
          ),),
          Text(penggunaan.toString(),
          style: TextStyle(
            fontSize: _fontsize,
            fontFamily: 'Koulen',
            color: Colors.red[700]
          ),)
        ]
      );
    }
  }

  Widget _textSelamatDatang(String nama){
    return Text("Selamat datang, "+nama+"!",
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Righteous'
      ), textAlign: TextAlign.right,
    );
  }

  

}