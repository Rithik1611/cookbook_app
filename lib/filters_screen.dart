import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluternfree = false;
  var _lactosefree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _gluternfree = widget.currentFilters[Filter.glutenFree]!;
    _lactosefree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        centerTitle: false,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _gluternfree,
            Filter.lactoseFree: _lactosefree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluternfree,
              onChanged: (value) {
                setState(() {
                  _gluternfree = value;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: Text(
                "Display only Gluten free meals",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            SwitchListTile(
              value: _lactosefree,
              onChanged: (value) {
                setState(() {
                  _lactosefree = value;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: Text(
                "Display only Lactose free meals",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (value) {
                setState(() {
                  _vegetarian = value;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: Text(
                "Display only vegetarian meals",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (value) {
                setState(() {
                  _vegan = value;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              subtitle: Text(
                "Display only vegan meals",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
