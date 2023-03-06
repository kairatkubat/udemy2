import 'package:flutter/material.dart';
import 'package:udemy2/categories_screen.dart';
import 'package:udemy2/category_meal_screen.dart';

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
        secondaryHeaderColor: Color.fromRGBO(255, 259, 245, 1),
       
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
      },
    );
  }
}
