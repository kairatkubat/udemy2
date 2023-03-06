

import 'package:flutter/material.dart';

class CategoryScreenMeal extends StatelessWidget {
  static const routName = '/category-mail'; 
  //   

  @override
  Widget build(BuildContext context) {
    final routArgs =  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    return   Scaffold(
      appBar: AppBar(title:  Text(categoryTitle!)),
      body: const Center(
        child: Text("The category of meal"),
      ),
    );
  }
}