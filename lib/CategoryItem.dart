import 'package:flutter/material.dart';
import 'category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String title;
   final Color color;
  const CategoryItem(this.color, this.title,  this.Id,);

    selectCategory(BuildContext context){
     Navigator.of(context).pushNamed (
    //   MaterialPageRoute(builder: 
    //  (context) => CategoryScreenMeal(Id, title),)
  CategoryScreenMeal.routName, arguments: {
      'id': Id,
      'title': title 
    }
     
     );
  }

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(50),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.7), color ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
        ),  
        child: Text(title, textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,),
        
      ),
    );
  }
}