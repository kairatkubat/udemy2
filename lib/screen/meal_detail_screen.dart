import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routName = '/meal-detail';
  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String text){
    return  Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(text , style:  Theme.of(context).textTheme.titleMedium  ,),
          );
  }

  @override
  Widget build(BuildContext context) {
    
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) =>   element.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,), 
            
          ),
          buildSectionTitle(context, "Ingridients : "),
          Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all( color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            ),
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).secondaryHeaderColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(selectedMeal.ingredients[index]),
                ),
                ),
            ),
          )
        ],
      ),
    );
    
  }
}