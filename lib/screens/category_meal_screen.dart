import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/cateogry-meal';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  var _loadInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 30,
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.lightBlue,
                  Color(0xFF5500FF),
                ]),
          ),
        ),
        title: Text(categoryTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22)),
      ),
      body: (displayedMeal.length > 0)
          ? (!isLandscape 
              ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    return MealItem(
                      id: displayedMeal[index].id,
                      title: displayedMeal[index].title,
                      imageURL: displayedMeal[index].imageURL,
                      duration: displayedMeal[index].duration,
                      complexity: displayedMeal[index].complexity,
                      affordability: displayedMeal[index].affordability,
                    );
                  },
                  itemCount: displayedMeal.length,
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (ctx, index) {
                    return MealItem(
                      id: displayedMeal[index].id,
                      title: displayedMeal[index].title,
                      imageURL: displayedMeal[index].imageURL,
                      duration: displayedMeal[index].duration,
                      complexity: displayedMeal[index].complexity,
                      affordability: displayedMeal[index].affordability,
                    );
                  },
                  itemCount: displayedMeal.length,
                ))
          : Center(
              child: Text(
                  'No recipes for this category yet! Clear any filters to view all the recipes'),
            ),
            
    );
    
  }
}
