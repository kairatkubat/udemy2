import 'package:flutter/material.dart';
import 'package:udemy2/model/SwitchTile.dart';
import 'package:udemy2/widgets/main_drawer.dart';

class FilteredScreen extends StatefulWidget {
   final Function(Map<String, bool>) saveFilters;
  static const routName = '/filters';
  final Map<String, bool> currentFilters;

 FilteredScreen(this.saveFilters, this.currentFilters );

  @override
  State<FilteredScreen> createState() => _FilteredScreenState();
}

class _FilteredScreenState extends State<FilteredScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  var _vegan = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegeterian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!; 
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          final selectedFilters = {
     'gluten': _glutenFree,
     'lactose': _lactoseFree,
     'vegeterian': _vegetarian,
     'vegan': _vegan 
  }; 
          widget.saveFilters(selectedFilters); }, icon: const Icon(Icons.save))],
        title: const Text("Your filter")), 
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