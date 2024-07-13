import 'package:cookbook/categories.dart';
import 'package:cookbook/meals_screen.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  void _onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const Categories();
    var pagetitle = "Categories";

    if (_selectedIndex == 1) {
      activeScreen = const MealsScreen(meals: []);
      pagetitle = "Favorites";
    }

    return Scaffold(
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
