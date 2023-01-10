import 'package:activity5/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    title: "Activity 5 - Image Picker",
    home: HomePage(),
  ));
}