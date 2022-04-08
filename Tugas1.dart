import 'dart:io';

void main(List<String> args){
  bool loop=true;
  while(loop){
    stdout.write("pilih\n1. Nomor 1\n2. Nomor 2\n3. Nomor 3");
    stdout.write("\n4. Nomor 4\n5. Nomor 5\n6. Nomor 6\n7. Nomor 7");
    print("\n99. keluar");
    int pilihan = int.parse(stdin.readLineSync().toString());
    switch(pilihan){
      case 1:{number1();break;}
      case 2: {
        stdout.write("Masukan kata = ");
        String temp = stdin.readLineSync().toString();
        split(temp, checkLength(temp));
        stdout.write("\npress enter to continue\n");
        stdin.readLineSync();
        break;
      }
      case 3:{number3();stdout.write("\npress enter to continue\n");
        stdin.readLineSync();break;}

      case 4:{triangleLoop();stdout.write("\npress enter to continue\n");
        stdin.readLineSync(); break;}

      case 5:{loopConditional();stdout.write("\npress enter to continue\n");
        stdin.readLineSync();;break;}

      case 6:{selamatMalam(); stdout.write("\npress enter to continue\n");
        stdin.readLineSync(); break;}
      case 7:{
        stdout.write("Nama\t: ");
        String nama = stdin.readLineSync().toString();
        stdout.write("Hobby\t: ");
        String hobby = stdin.readLineSync().toString();
        datadiri(nama, hobby);
        stdout.write("\npress enter to continue\n");
        stdin.readLineSync(); break;
      }

      case 99:{loop=false;break;}

      default:break;
    }
  }
}

number1(){
  var pertama = "Flutter";
  var kedua= "Is";
  var ketiga = "Awesome";
  print("output : "+pertama+" "+kedua+ " "+ketiga+"\n\n");
}


checkLength(String text){
  int a=0;
  for(int i=0;i<text.length;i++){
    text[i]==' '?a+=1:a+=0;
  }
  return a;
}

split(String text, int max){
  final result = text.split(' ');
  print("Kalimat lengkap = "+text+"\n");
  for(int i=0;i<=max;i++){
    print("Kata["+ i.toString() +"] = "+result[i]);
  }
  print("\n\n");
}

number3(){
  print("\n\n");
  stdout.write("Masukan nama depan : ");
  String depan = stdin.readLineSync().toString();
  stdout.write("\nMasukan nama belakang : ");
  String belakang = stdin.readLineSync().toString();
  print("output : nama lengkap = "+depan+" "+belakang);
  print("\n\n");
}

triangleLoop(){
  stdout.write("banyak baris = ");
  int banyak = int.tryParse(stdin.readLineSync().toString()) ?? 0;
  print("\n");
  for(int i=0;i<banyak;i++){
    for(int j=0;j<=i;j++){
      stdout.write("*");
    }
    print("");
  }
}

loopConditional(){
  print("\n\n");
  for(int i=1;i<=20;i++){
    if(i%3==0&&i>3){
      print(i.toString() + " - Skip");
    }
    else if(i%2==0){
      print(i.toString() + " - Genap");
    }
    else if(i%2==1){
      print(i.toString() + " - Ganjil");
    }
  }
}

selamatMalam(){
  print("\nSelamat Malam");
}

datadiri(String nama,String hobby){
  print("Nama saya "+nama+" saya memiliki hobby "+hobby);
}
