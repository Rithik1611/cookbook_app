import 'package:cookbook/category.dart';
import 'package:cookbook/meal.dart';
import 'package:cookbook/meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggle,
      required this.availablemeals});

  final Category category;
  final void Function(Meal meal) onToggle;
  final List<Meal> availablemeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MealsScreen(
              onToggle: onToggle,
              title: category.title,
              meals: availablemeals
                  .where((meal) => meal.categories.contains(category.id))
                  .toList()),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
