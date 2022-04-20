import 'dart:io';

void main(List<String> args) {
  print(fungsiRange(1, 10));
  listMultidimensi();

  Lingkaran temp=new Lingkaran();
  temp.setRadius(7);
  print(temp.luas());
}

listMultidimensi(){ //Nomor 2
  List<List<String>> Orang=[
    ["001","Akhmal Dimas","Sleman","Gaming"],
    ["002","Dimas Pratama","Yogyakarta","Berkebun"],
    ["003","Rafli Kavarera","Tangerang","Tidur"]
  ];

  print(Orang);
}

List<int> fungsiRange(int awal, int akhir){//Nomor 1
  List<int> result=[];
  while(awal<=akhir){
    result.add(awal);
    awal++;
  }
  return result;
}



class Lingkaran{
  double _phi = 3.14;
  double? radius;

  void setRadius(double r){
    radius=r;
  }
  double getRadius() => radius!;

  double luas(){
    return _phi*radius!*radius!;
  }
}