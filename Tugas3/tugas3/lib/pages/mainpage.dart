import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex=0;
  final List<Widget> _widgetOptions = <Widget>[
    Text("Index 0 : Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
    Text("Index 1 : Business", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
    Text("Index 2 : School", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: _widgetOptions.elementAt(_currentIndex)),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green[300],
        iconSize: 35,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            tooltip: "Home"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.business_center),
          tooltip: "Business",
          label: "Business"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school),
          tooltip: "School",
          label: "School"
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );
  }
}
