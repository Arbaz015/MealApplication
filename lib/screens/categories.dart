import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/category_gridview_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.toggleFavorites, required this.availableMeals});
  final void Function(Meal meal) toggleFavorites;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category cateogory) {
    final filterMeal = availableMeals
        .where((meal) => meal.categories.contains(cateogory.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (ctx) => MealScreen(
                title: cateogory.title,
                meals: filterMeal,
                toggleFavorites: toggleFavorites,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridviewItems(
              category: category,
              tapedScreen: () {
                _selectCategory(context, category);
              }),
      ],
    );
  }
}
