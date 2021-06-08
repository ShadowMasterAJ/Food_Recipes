import 'package:flutter/material.dart';
import '../../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'cateogry-meal';
  // final String id;
  // final String title;
  // CategoryMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(
            categoryMeals[index].title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
