import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryGridviewItems extends StatelessWidget {
  const CategoryGridviewItems(
      {super.key, required this.category, required this.tapedScreen});

  final Category category;
  final void Function() tapedScreen;

  void _mealScreen() {
    print('tapped');
    // const MealScreen();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: tapedScreen,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
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
