import 'package:flutter/material.dart';

import './category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void onPressCategory(ctx) {
    Navigator.of(ctx).pushNamed(
      'categories-meal',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                color.withOpacity(0.7),
                color,
              ]),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
