import 'package:cookbook/categories.dart';
import 'package:cookbook/dummy_data.dart';
import 'package:cookbook/filters_screen.dart';
import 'package:cookbook/meal.dart';
import 'package:cookbook/meals_screen.dart';
import 'package:cookbook/side_drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List<Meal> favorites = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showMessage(String txt) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txt)));
  }

  void _toggleFavorites(Meal meal) {
    final isExisting = favorites.contains(meal);
    if (isExisting) {
      setState(() {
        favorites.remove(meal);
      });
      _showMessage("Meal removed from Favorites");
    } else {
      setState(() {
        favorites.add(meal);
      });
      _showMessage("Meal added to Favorites");
    }
  }

  void _onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _screenSelect(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => FiltersScreen(
          currentFilters: _selectedFilters,
        ),
      ));
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen =
        Categories(availablemeals: availablemeals, onToggle: _toggleFavorites);
    var pagetitle = "Categories";

    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(meals: favorites, onToggle: _toggleFavorites);
      pagetitle = "Favorites";
    }

    return Scaffold(
      drawer: SideDrawer(onSelect: _screenSelect),
      appBar: AppBar(
        title: Text(pagetitle),
        centerTitle: false,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onSelectIndex,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Categories', icon: Icon(Icons.set_meal_rounded)),
            BottomNavigationBarItem(
                label: 'Favorites', icon: Icon(Icons.star_border_outlined))
          ]),
    );
  }
}
