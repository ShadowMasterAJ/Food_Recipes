import 'package:flutter/material.dart';
import 'package:food_recipes/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _builListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Colors.lightBlue,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Raleway',
            color: Colors.white,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                color: Colors.black,
              ),
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'More Options!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _builListTile('Categories', Icons.restaurant_menu_rounded, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            _builListTile('Filters', Icons.filter_alt_sharp, () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
