import 'dart:io';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorite recipes yet: \nClick on the star button in the recipes to favorite them',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return !isLandscape
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageURL: favoriteMeals[index].imageURL,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                );
              },
              itemCount: favoriteMeals.length,
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withAlpha(170),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              height: 400,
              width: double.infinity,
              child: GridView.builder(
                  itemCount: favoriteMeals.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 350,
                    childAspectRatio: 8 / 3,
                  ),
                  itemBuilder: (ctx, index) {
                    return MealItem(
                      id: favoriteMeals[index].id,
                      title: favoriteMeals[index].title,
                      imageURL: favoriteMeals[index].imageURL,
                      duration: favoriteMeals[index].duration,
                      complexity: favoriteMeals[index].complexity,
                      affordability: favoriteMeals[index].affordability,
                    );
                  }),
            );
    }
  }
}
