
import 'package:flutter/material.dart';
import 'package:udemy2/model/meal.dart';
import 'package:udemy2/widgets/meal_item.dart';
import '../model/meal.dart';
class CategoryScreenMeal extends StatefulWidget {
  static const routName = '/category-mail'; 
  final  List<Meal> availableMeals;

  CategoryScreenMeal(this.availableMeals); 

  @override
  State<CategoryScreenMeal> createState() => _CategoryScreenMealState();
}

class _CategoryScreenMealState extends State<CategoryScreenMeal> {
   late String categoryTitle;
   late List <Meal> displayedMeal;
  var _ifChanged = false;
  
  @override
  void initState() {
    // TODO: implement initState
    
     
  }


void _removeMeal(String mealId){
   setState(() {
      displayedMeal.removeWhere((element) =>  element.id == mealId );
   });
}
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!_ifChanged){
      final routArgs =  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArgs['id'];
     categoryTitle = routArgs['title'] as String;
    final categoryAddress = routArgs['address'];
   displayedMeal  = widget.availableMeals .where((element){    
    return element.categories.contains(categoryId);  
   
   }).toList();
    _ifChanged = true; 
    }
  }
  //   
  @override
  Widget build(BuildContext context) {
    

    return   Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!)),
      body: ListView.builder(itemBuilder: ((context, index) {
         return 
            MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title, 
              imageUrl: displayedMeal[index].imageUrl, 
              duration: displayedMeal[index].duration, 
              complexity: displayedMeal[index].complexity,
               affordability: displayedMeal[index].affordability,
               removeItem: _removeMeal ,
               ); 
      }), itemCount: displayedMeal.length   ,)
    );
  }
}