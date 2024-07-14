import 'package:cookbook/meal.dart';
import 'package:flutter/material.dart';

class MealDescription extends StatelessWidget {
  const MealDescription(
      {super.key, required this.meal, required this.onToggle});

  final Meal meal;
  final void Function(Meal meal) onToggle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    onToggle(meal);
                  },
                  icon: const Icon(Icons.star_border))
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 4,
              ),
              Text('Duration :${meal.duration.toString()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              Column(
                children: [
                  Text("INGRIDIENTS :",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                  for (final ingridients in meal.ingredients)
                    Text('- ${ingridients}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('STEPS :',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                  for (final steps in meal.steps)
                    Text('- ${steps}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 4,
                  )
                ],
              )
            ],
          )),
    );
  }
}
