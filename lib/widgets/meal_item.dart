import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipes/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id, title, imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    this.id,
    this.title,
    this.imageURL,
    this.duration,
    this.complexity,
    this.affordability,
  });

  void onPressMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {}
    });
  }

  // String get complexityText {
  //   switch (complexity) {
  //     case Complexity.Easy:
  //       return 'Easy';
  //     case Complexity.Medium:
  //       return 'Medium';
  //     case Complexity.Difficult:
  //       return 'Difficult';
  //   }
  // }

  // String get affordabilityText {
  //   switch (affordability) {
  //     case Affordability.Affordable:
  //       return '\$';
  //     case Affordability.Pricey:
  //       return '\$\$';
  //     case Affordability.Luxurious:
  //       return '\$\$\$';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      margin: EdgeInsets.all(15),
      child: InkWell(
        radius: 5,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        onTap: () => onPressMeal(context),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
                    decoration: BoxDecoration(
                      color: Colors.grey[900].withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_outlined, size: 20),
                      SizedBox(width: 10),
                      Text('$duration min',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_rounded),
                      SizedBox(width: 10),
                      Text(
                        describeEnum(complexity),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(
                        describeEnum(affordability),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
