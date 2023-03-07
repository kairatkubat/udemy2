import 'package:flutter/material.dart';
import 'package:udemy2/model/meal.dart';
import 'package:udemy2/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;  
  final Affordability affordability;
 
    

const MealItem({
  required this.id,  
  required this.title,
  required this.imageUrl,
  required this.duration,
  required this.complexity,
  required this.affordability,

  
  });
String? get complexityText{
  switch(complexity){
    case Complexity.Simple: 
    return "Simple";
    case Complexity.Hard:
    return "Hard";
    break;
    case Complexity.Challenging: return "Challenging"; break;
  }
}
String? get affordabilityText{
  switch(affordability){
    case Affordability.Affordable: 
    return "Affordability";
    case Affordability.Luxurious:
    return "Expensive";
    break;
    case Affordability.Pricey: return "Pricey"; break;
  }
  
}

 void seletMeal(BuildContext context){
  Navigator.of(context).pushNamed( MealDetailScreen.routName, arguments: id ); 
 }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seletMeal(context),
      child: Card(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children:  <Widget> [
              ClipRRect(borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(imageUrl, height:  250, width: double.infinity, fit: BoxFit.cover,),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.black54,
                  child: Text(title, style: const TextStyle(fontSize: 26, color: Colors.white,),
                  softWrap: true,
                  overflow: TextOverflow.fade,),
                ),
              ),
            ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
              Row(children:  [
                const Icon(Icons.schedule),
                const SizedBox(width: 15,),
                Text('$duration min'),
              ],),
              Row(children:  [
                const Icon(Icons.work),
                const SizedBox(width: 15,),
                Text(complexityText!),
              ],),
               Row(children:  [
                const Icon(Icons.price_change),
                const SizedBox(width: 15,),
                Text(affordabilityText!),
              ],)
            ],),
            )
          ],
        ),
      ),
    );
  }
}