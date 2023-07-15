import 'package:flutter/material.dart';
import 'package:recipe_calculator/screen/recipe_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Recipe Calculator',
      home: Scaffold(
        body: RecipeScreen(),
      ),
    );
  }
}