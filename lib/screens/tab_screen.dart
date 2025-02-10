import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  var selectPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _toggleFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      _favoriteMeals.remove(meal);

      if (_favoriteMeals.isEmpty) {
        setState(() {
          selectPageIndex = 1;
        });
      }
    } else {
      _favoriteMeals.add(meal);
    }
  }

  void _selectPage(final index) {
    setState(() {
      selectPageIndex = index;
      print(selectPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    Widget activePage =
        CategoriesScreen(toggleFavorites: _toggleFavoriteStatus);
    if (selectPageIndex == 1) {
      activePage = MealScreen(
          meals: _favoriteMeals, toggleFavorites: _toggleFavoriteStatus);
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
