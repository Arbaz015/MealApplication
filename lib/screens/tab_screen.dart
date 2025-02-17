import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

const kInitialFilter = {
  Filters.GlutenFree: false,
  Filters.LactoseFree: false,
  Filters.VeganFreen: false,
  Filters.VegitarianFree: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  Map<Filters, bool> _selectedFilters = kInitialFilter;
  var selectPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _toggleFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      _favoriteMeals.remove(meal);
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

  void _setScreen(String identifire) async {
    Navigator.of(context).pop();

    if (identifire == 'filters') {
      final result = await Navigator.of(context)
          .push<Map<Filters, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFilter: _selectedFilters,
                  )));

      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.GlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.LactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.VeganFreen]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.VegitarianFree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(
      toggleFavorites: _toggleFavoriteStatus,
      availableMeals: availableMeals,
    );
    if (selectPageIndex == 1) {
      activePage = MealScreen(
          meals: _favoriteMeals, toggleFavorites: _toggleFavoriteStatus);
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
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
