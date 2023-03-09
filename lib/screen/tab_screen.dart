import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List <Map <String, Object >> _pages = const [
   
    {'page': CatergoriesScreen(), 'title': "Categories"},
      {'page': FavoriteScreen(), 'title': "Favorite "}
  ];
  int selectedPageIndex = 1;
  void _selectPage(int index){
    setState(() {
      selectedPageIndex = index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text(_pages[selectedPageIndex]['title'] as String),
     ),
      body:  _pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar:  BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap:  _selectPage,
        backgroundColor: Theme.of(context).primaryColor ,
      items:const  [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Categories",
          
    ),
     BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorite",
          
    ),
    
    ],),
    );
  }
}