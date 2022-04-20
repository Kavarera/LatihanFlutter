import 'bangun_datar.dart';

class Lingkaran extends BangunDatar{

  double? _radius;
  Lingkaran(double r){
    _radius = r;
  }

  @override
  double? keliling()=> 2*3.14*_radius!;
  double? luas()=> 3.14*_radius!*_radius!;

}