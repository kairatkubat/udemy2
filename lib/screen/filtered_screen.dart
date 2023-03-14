import 'package:flutter/material.dart';
import 'package:udemy2/model/SwitchTile.dart';
import 'package:udemy2/widgets/main_drawer.dart';

class FilteredScreen extends StatefulWidget {
  static const routName = '/filters';

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  var _vegan = false;
   

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Your filter")), 
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child:  Text("AdJust your meal selection", style: Theme.of(context).textTheme.titleMedium ,),
          ),
          Expanded(child: ListView(children: [
          buildSwitchTile("Gluten Free", 'Only gluten-free meals', _glutenFree, (hw){
            setState(() {
              _glutenFree = hw;
            });
          }),
           buildSwitchTile("Lactose Free", 'Only lactose free meals', _lactoseFree, (hw){
            setState(() {
              _lactoseFree = hw;
            });
          }),
            buildSwitchTile("Vegeterian", 'Only vegeterian meals', _vegetarian, (hw){
            setState(() {
              _vegetarian = hw;
            });
          }),
           buildSwitchTile("Vegan ", 'Vegan meals', _vegan, (hw){
            setState(() {
              _vegan = hw;
            });
          })
          ],))
        ],
      ),
    );
  }
}