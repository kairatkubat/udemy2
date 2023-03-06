

import 'dart:math';

import 'package:flutter/material.dart';
import 'dummy_data.dart';
class CategoryScreenMeal extends StatelessWidget {
  static const routName = '/category-mail'; 
  //   

  @override
  Widget build(BuildContext context) {
    final routArgs =  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArgs['id'];
    final categoryTitle = routArgs['title'];
   final categoryMeals = DUMMY_MEALS.where((element){    
    return element.categories.contains(categoryId);  
   }).toList();

    return   Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!)),
      body: ListView.builder(itemBuilder: ((context, index) {
         return Text(categoryMeals[index].title); 
      }), itemCount: categoryMeals.length   ,)
    );
  }
}