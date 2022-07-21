import 'dart:convert';
import 'package:apijson_rafli/model/product.dart';
import 'package:apijson_rafli/pages/detailproduct.dart';
import 'package:apijson_rafli/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> listData =[];
  TextEditingController _searchTextFieldController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();

  bool _isLoading =false;
  bool _isFirstLoading = false;
  bool _searchMode = false;

  int _limit = 5;

  String apiUrl = "https://dummyjson.com/products?limit=";
  Future _getData() async{
    try{
      setState(() {
        _limit=5;
        _searchMode=false;
        _isFirstLoading=true;
      });
      var respon = await http.get(Uri.parse(apiUrl+_limit.toString()));

      List data = (json.decode(respon.body) as Map<String, dynamic> )["products"];
      //print(data.runtimeType);
      //print(data.elementAt(0));
      data.forEach((element) {
        listData.add(Product.fromJson(element));
      });
      setState(() {
        listData.isNotEmpty;
        _isFirstLoading=false;
      });
    }
    catch(er){
      print("=========\n\n$er\n\n========");
    }
  }

  void _getMoreData() async{
    try{
      setState(() {
        _isLoading=true;
      });
      var respon = await http.get(Uri.parse(apiUrl+"5&skip="+_limit.toString()));

      List data = (json.decode(respon.body) as Map<String, dynamic> )["products"];
      //print(data.runtimeType);
      //print(data.elementAt(0));
      data.forEach((element) {
        listData.add(Product.fromJson(element));
      });
      setState(() {
        listData.isNotEmpty;
        _limit+=5;
        _isLoading=false;
      });
    }
    catch(er){
      print("=========\n\n$er\n\n========");
    }
  }

  void _searchData(String query) async {
    const String _apiSearch = "https://dummyjson.com/products/search?q=";
    try{
      setState(() {
        _isLoading=true;
        listData.clear();
      });
      var respon = await http.get(Uri.parse(_apiSearch+query));

      List data = (json.decode(respon.body) as Map<String, dynamic> )["products"];
      //print(data.runtimeType);
      //print(data.elementAt(0));
      data.forEach((element) {
        listData.add(Product.fromJson(element));
      });
      setState(() {
        listData.isNotEmpty;
        _limit+=5;
        _isLoading=false;
      });
    }
    catch(er){
      print("=========\n\n$er\n\n========");
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    _getData();
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.extentAfter<=0&&_searchMode==false){
        _getMoreData();
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, "+FirebaseAuth.instance.currentUser!.email.toString()),
        actions: [
          TextButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut()
            .then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage())));
          }, child: Text("Sign Out",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold))),
        ],
      ),
      body: _isFirstLoading==true ? CircularProgressIndicator() : SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchTextFieldController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Search Product",
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      listData.clear();
                      print("--------------------\n\n"+apiUrl);
                      _searchMode=true;
                      //apiUrl="https://dummyjson.com/products/search?q="+_searchTextFieldController.text;
                      _searchTextFieldController.text.isEmpty ? _getData() : _searchData(_searchTextFieldController.text);
                      print(apiUrl);
                    });
                  },
                  child: Text("Search"),
                  ),
                ],

              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: listData == null? 0 : listData.length,
                controller: _scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return ItemProduct(listData.elementAt(index));
                }
              ),
            ),
          _isLoading==false? SizedBox(height: 5,): CircularProgressIndicator()
          ],
        )
      ),
    );
  }

  Widget ItemProduct(Product p){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailProduct(product: p);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(left: 5,right: 5,top: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0,5)
            ),
          ],
        ),
        padding: EdgeInsets.all(5),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Hero(
                tag: p.id.toString(),
                child: Container(
                  margin: EdgeInsets.only(top: 5,bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(p.thumbnail),
                    radius: 50,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10,top: 5),
                  child: Column(
                    children: [
                      Text(p.title,
                              style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                      Expanded(
                        child: Text(p.description,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 14
                        ),),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("\$"+p.price.toString(),style: TextStyle(fontSize: 12),),
                            Text("Rating : "+p.rating.toString(),
                            style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}