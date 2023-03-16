import 'package:flutter/material.dart';
import 'package:udemy2/widgets/main_drawer.dart';

import '../model/meal.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
 static const routName = '/tabscreen';
 final  List<Meal> favoriteMeals;

 TabScreen(this.favoriteMeals); 
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List <Map <String, Object >> _pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    _pages =   [
   
    {'page': CatergoriesScreen(), 'title': "Categories"},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': "Favorite "}
  ];
    super.initState();

  }

  void _selectPage(int index){
    setState(() {
      selectedPageIndex = index ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text(_pages[selectedPageIndex]['title'] as String, textAlign: TextAlign.center,),
     ),
     drawer: const MainDrawer(),
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