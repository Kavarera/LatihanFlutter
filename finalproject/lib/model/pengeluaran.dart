class Pengeluaran{
  final String Judul;
  late String Deskripsi;
  final int Jumlah;
  final String Date;

  Pengeluaran(
    this.Judul, String? _deskripsi,this.Jumlah,this.Date
  ){
    _deskripsi==null ? this.Deskripsi="No Description" : this.Deskripsi = _deskripsi;
  }
}