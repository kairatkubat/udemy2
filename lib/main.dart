import 'package:flutter/material.dart';
import 'package:udemy2/screen/categories_screen.dart';
import 'package:udemy2/screen/category_meal_screen.dart';
import 'package:udemy2/screen/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
      
        primarySwatch: Colors.pink,
        canvasColor: Colors.amber[100],
        secondaryHeaderColor: Color.fromARGB(255, 203, 130, 200),
       
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
      initialRoute: CatergoriesScreen.routeName ,
      routes: { 
       CatergoriesScreen.routeName:(context) => const CatergoriesScreen(),
        CategoryScreenMeal.routName :(context) => CategoryScreenMeal(),
        MealDetailScreen.routName :(context) => MealDetailScreen(),
      },
    );
  }
}
