import 'package:finalproject/model/pengeluaran.dart';

class Laporan{
  final String Judul;
  final String Deskripsi;

  List<Pengeluaran> RekapPengeluaran = List.empty(growable: true);
  Laporan(
    this.Judul,
    this.Deskripsi,
    this.RekapPengeluaran
  );
}