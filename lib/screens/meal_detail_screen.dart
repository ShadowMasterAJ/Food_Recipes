import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    Widget sectionTitleBuilder(context, title) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.lightBlue[400],
                // Colors.pink[400],
                Colors.pink[400],
              ]),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 30,
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: FittedBox(
            child: Text(
              '${selectedMeal.title}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.lightBlue[400],
                    // Colors.pink[400],
                    Colors.purple,
                  ]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    selectedMeal.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sectionTitleBuilder(context, 'Ingredients'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withAlpha(170),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                height: 220,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 60,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (ctx, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white12),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.white30,
                          ]),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            selectedMeal.ingredients[index],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sectionTitleBuilder(context, 'Recipe'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withAlpha(170),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                height: 370,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          '${selectedMeal.steps[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Raleway',
                              color: Colors.white),
                        ),
                      ),
                      Divider(color: Colors.white54),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
