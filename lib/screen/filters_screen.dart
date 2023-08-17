import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
 

  


  static const routename = '/filters';
  Function saveFilters;
  FilterScreen(this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool?) updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions: [IconButton(onPressed:()=>widget.saveFilters , icon: Icon(Icons.save))],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'adjust your meal selection',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten free',
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue ?? true;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include gluten free',
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue ?? true;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegeterian',
                  'Only include gluten free',
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue ?? true;
                    });
                  },
                ),
                buildSwitchListTile(
                  'vegan',
                  'Only include gluten free',
                  vegan,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue ?? true;
                    });
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
