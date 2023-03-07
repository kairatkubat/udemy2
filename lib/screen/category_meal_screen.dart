
import 'package:flutter/material.dart';
import 'package:udemy2/widgets/meal_item.dart';
import '../dummy_data.dart';
class CategoryScreenMeal extends StatelessWidget {
  static const routName = '/category-mail'; 
  //   

  @override
  Widget build(BuildContext context) {
    final routArgs =  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArgs['id'];
    final categoryTitle = routArgs['title'];
    final categoryAddress = routArgs['address'];
   final categoryMeals = DUMMY_MEALS.where((element){    
    return element.categories.contains(categoryId);  
   }).toList();

    return   Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!)),
      body: ListView.builder(itemBuilder: ((context, index) {
         return 
            MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title, 
              imageUrl: categoryMeals[index].imageUrl, 
              duration: categoryMeals[index].duration, 
              complexity: categoryMeals[index].complexity,
               affordability: categoryMeals[index].affordability); 
      }), itemCount: categoryMeals.length   ,)
    );
  }
}