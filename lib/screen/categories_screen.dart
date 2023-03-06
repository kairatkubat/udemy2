import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/CategoryItem.dart'; 

class  CatergoriesScreen extends StatelessWidget {
  static const routeName = '/home';

  const  CatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const data = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(title: const Text("DailyMeal")),
      body : GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:  3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, 
          ) ,
         children: [...data.map((e) =>
         CategoryItem(
          e.id, e.title, e.color, e.address
         )).toList()],
       ),
    );
  }
}