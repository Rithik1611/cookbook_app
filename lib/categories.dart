import 'package:cookbook/category_grid_item.dart';
import 'package:cookbook/dummy_data.dart';
import 'package:cookbook/meal.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key, required this.onToggle, required this.availablemeals});
  final void Function(Meal meal) onToggle;
  final List<Meal> availablemeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (final i in availableCategories)
          CategoryGridItem(
            availablemeals: availablemeals,
            category: i,
            onToggle: onToggle,
          )
      ],
    );
  }
}
