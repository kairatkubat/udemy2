import 'package:flutter/material.dart';
import 'package:udemy2/dummy_data.dart';
import 'package:udemy2/screen/categories_screen.dart';
import 'package:udemy2/screen/category_meal_screen.dart';
import 'package:udemy2/screen/filtered_screen.dart';
import 'package:udemy2/screen/meal_detail_screen.dart';
import 'package:udemy2/screen/tab_screen.dart';

import 'model/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
     'gluten': false,
     'lactose': false,
     'vegeterian': false,
     'vegan': false
  };
//togling favorite 

void _togleFavorite(String mealId){
 final existingElement = _favoriteMeals.indexWhere((element) => element.id == mealId);
 if(existingElement>=0){
  setState(() {
    _favoriteMeals.removeAt(existingElement);
  });
 }
 else{
  _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
 }
}
// filter function
  void  setFilters(Map<String, bool> filterData){
     setState(() {
       _filters = filterData; 
       _avialableMeals = DUMMY_MEALS.where((element) {
          if(_filters['gluten']!&&!element.isGlutenFree){
            return false;
          }
           if(_filters['lactose']!&&!element.isLactoseFree){
            return false;
          }
           if(_filters['vegeterian']!&&!element.isVegetarian){
            return false;
          }
           if(_filters['vegan']!&&!element.isVegan ){
            return false;
          }

          return true;
       } 
         ).toList();
     });
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  List<Meal> _avialableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = []; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
      
        primarySwatch: Colors.pink,
        canvasColor: Colors.amber[100],
        secondaryHeaderColor: const Color.fromARGB(255, 203, 130, 200),
       
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)
          ),
          titleLarge:  const TextStyle(
            fontSize: 28, 
            fontWeight: FontWeight.bold
          ),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
      ),
      
      routes: { 
        '/':(context) => TabScreen(_favoriteMeals),
       CatergoriesScreen.routeName:(context) => const CatergoriesScreen(),
        CategoryScreenMeal.routName :(context) => CategoryScreenMeal(_avialableMeals),
        MealDetailScreen.routName :(context) => MealDetailScreen(_togleFavorite, _isMealFavorite),
        FilteredScreen.routName :(context) => FilteredScreen(setFilters, _filters),
        TabScreen.routName :(context) => TabScreen(_favoriteMeals)
      },
    );
  }
}
