import 'dart:async';
import 'persegi.dart';
import 'lingkaran.dart';

void main() async{
  print("persegi");
  Persegi p = new Persegi(9);
  print("keliling = ${p.keliling()}");
  print("luas = ${p.luas()}");

  print("lingkaran");
  Lingkaran l = new Lingkaran(2.5);
  print("keliling = ${l.keliling()}");
  print("luas = ${l.luas()}");
  print("\n\n");
  futuredelay("Nama", 1);
  futuredelay("Rafli", 3);
  futuredelay("Saya", 2);

  await futuredelay("\n\n", 4);
  print("Menyanyi, mulai");
  await futuredelay("Pelangi-pelangi alangkah indahmu", 1);

  await futuredelay("Merah kuning hijau", 2);

  await futuredelay("dilangit yang biru", 1);

}

Future<void> futuredelay(String text, int durasi){
  return Future.delayed(Duration(seconds: durasi),() => print(text));
}