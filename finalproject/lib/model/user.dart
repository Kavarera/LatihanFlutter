import 'package:finalproject/model/pengeluaran.dart';

class User{
  final int Id;
  final int LimitMonth;
  final String Username;
  final String Email;

  static late List<Pengeluaran> PengeluaranTemp = List.empty(growable: true);
  
  const User(
    this.Id,
    this.LimitMonth,
    this.Username,
    this.Email
  );

  static void AddPengeluaranTemporary(Pengeluaran pengeluaran){
    PengeluaranTemp.add(pengeluaran);
  }

  static List<Pengeluaran> GetPengeluaranTemporary(){
    return PengeluaranTemp;
  }

  static void ClearPengeluaranTemporary(){
    PengeluaranTemp.clear();
  }
}