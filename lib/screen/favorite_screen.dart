import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child:  Text("No favorite meals, start adding favorite meals in meals page" , textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
      )),
      
    );
    }
    else {
      return ListView.builder(itemBuilder: ((context, index) {
         return 
            MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title, 
              imageUrl: favoriteMeals[index].imageUrl, 
              duration: favoriteMeals[index].duration, 
              complexity: favoriteMeals[index].complexity,
               affordability: favoriteMeals[index].affordability,
              //  removeItem: _removeMeal ,
               ); 
      }), itemCount: favoriteMeals.length   ,);
    }
    
  }
}