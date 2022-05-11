

import 'package:finalproject/model/laporan.dart';
import 'package:finalproject/model/pengeluaran.dart';

class DummyPengeluaran{
  static var _Pengeluarans = List<Laporan>.empty(growable: true);
  
  static List<Pengeluaran> _RekapTemp = [
    new Pengeluaran('Judul', 'Deskripsi', 1000, new DateTime.now().toString()),
    new Pengeluaran('Judul', 'Deskripsi', 1000, new DateTime.now().toString()),
    new Pengeluaran('Judul', 'Deskripsi', 1000, new DateTime.now().toString()),
    new Pengeluaran('Judul', 'Deskripsi', 1000, new DateTime.now().toString()),
    new Pengeluaran('Judul', 'Deskripsi', 1000, new DateTime.now().toString())
  ];

  static dynamic generateDummy(int length){
    for(int i=0;i<length;i++){
      _Pengeluarans.add(new Laporan('Dummy Title'+i.toString(),
       'description '+i.toString(),_RekapTemp));
    }
    return _Pengeluarans;
  }

  static dynamic getDummy(){
    return _Pengeluarans.length>0 ? _Pengeluarans : generateDummy(5);
  }

  static void addDummy(Laporan pengeluaran){
    _Pengeluarans.add(pengeluaran);
  }

}