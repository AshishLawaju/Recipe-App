import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mealapp/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 36,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BuildListTile('Meal', Icons.restaurant_menu, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildListTile('Filters', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
          })
        ],
      ),
    );
  }
}
