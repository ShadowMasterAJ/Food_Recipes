import 'package:flutter/foundation.dart';

enum Complexity {
  Easy,
  Medium,
  Difficult,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id, title, imageURL;
  final List<String> categories, ingredients, steps;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;

  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
