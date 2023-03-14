import 'package:flutter/material.dart';
 
Function? updateValue(){}

Widget buildSwitchTile(
  String title, String subtitle, bool currentValue, updateValue
){
  return SwitchListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    value: currentValue,
    onChanged: updateValue,
  );
}