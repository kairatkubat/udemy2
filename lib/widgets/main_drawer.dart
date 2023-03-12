import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon){
    return  ListTile(
          leading:   Icon(icon, size: 26), 
          title:  Text(title, style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onLongPress: () {
             
          },
        );
  }
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [ 
        Container(
          height: 150,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).secondaryHeaderColor,
          alignment: Alignment.centerLeft,
          child: const Text("Cooking up", style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30
          )
          ),
        ),
        const SizedBox(height: 20),
         buildListTile("Meal", Icons.restaurant),
         buildListTile("Filter", Icons.settings),
        buildListTile("Person", Icons.person),
      ]),
    ) ;
  }
}