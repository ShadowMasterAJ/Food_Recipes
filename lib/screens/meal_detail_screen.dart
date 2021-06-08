import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealID),
      ),
      body: Center(
        child: Text(
          'Meal Details...$mealID',
          style: TextStyle(fontSize: 20, color: Colors.yellow),
        ),
      ),
    );
  }
}
