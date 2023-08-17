import 'package:flutter/material.dart';
import 'package:mealapp/mealData.dart';
import 'package:mealapp/screen/categories_screen.dart';
import 'package:mealapp/screen/category_meal_screen.dart';
import 'package:mealapp/screen/filters_screen.dart';
import 'package:mealapp/screen/meal_detail_screen.dart';
import 'package:mealapp/screen/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        return false;  //yeta filter garna bakixa #25
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mealmeal',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 52, 51, 1)),
              titleMedium: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (c) =>
            CategoryMealsScreen(), //  / matra use garda home page route hunca default
        '/meal-detail': (ct) => MealDetailScreen(),
        FilterScreen.routename: (c) => FilterScreen(setFilters)
      },

      // onGenerateRoute: (settings) {  //for any route that is not register
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
      // },
      //  onUnknownRoute: ((settings) => MaterialPageRoute(builder: (ctx)=>CategoriesScreen() )) , //app 404 fallback page if doesnot exist
    );
  }
}
