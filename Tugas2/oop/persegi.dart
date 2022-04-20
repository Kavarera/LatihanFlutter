import 'bangun_datar.dart';

class Persegi extends BangunDatar{
  double? _sisi;
  Persegi(double sisi){
    _sisi = sisi;
  }

  @override 
  double? keliling() => 4*_sisi!;

  double? luas()=>_sisi!*_sisi!;

}