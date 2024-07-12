import 'package:cookbook/meal.dart';
import 'package:cookbook/meals_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealsItem(meal: meals[index])),
      ),
    );
  }
}