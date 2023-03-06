import 'package:flutter/material.dart';
import 'category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String title;
   final Color color;
   final String address;
  const CategoryItem(this.Id, this.title, this.color, this.address);

    selectCategory(BuildContext context){
     Navigator.of(context).pushNamed (
    //   MaterialPageRoute(builder: 
    //  (context) => CategoryScreenMeal(Id, title),)
  CategoryScreenMeal.routName, arguments: {
      'id': Id,
      'title': title,
      'address': address,
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
        child: Column(children: [
           Text(title, textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,),
        Text(address)
        ]),
        
      ),
    );
  }
}