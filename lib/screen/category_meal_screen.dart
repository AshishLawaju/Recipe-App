import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealapp/mealData.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName = '/categorory-meal';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // String? categoryTitle;
  // List<Meal>? displayMeals;
  //var loadedInitData = false;

  // void initState() {
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   if (!loadedInitData) {
      // final routeArgs =
      //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      // if (ModalRoute.of(context)?.settings.arguments == null) {
      //   final routeArgs =
      //       ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      // }
      // final categoryTitle = routeArgs['title'];
      // final categoryId = routeArgs['id'];

      // final displayedMeals = DUMMY_MEALS.where(
      //   (meal) {
      //     //filter garay

      //     return meal.categories.contains(categoryId);
      //   },
      // ).toList();

  //     loadedInitData = true;
  //   }

  //   super.didChangeDependencies();
  // }

  // void removeMeal(String mealId) {
  //   setState(() {
  //     displayMeals!.removeWhere((mel) => mel == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      if (ModalRoute.of(context)?.settings.arguments == null) {
        final routeArgs =
            ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      }
      final categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      final displayedMeals = DUMMY_MEALS.where(
        (meal) {
          //filter garay

          return meal.categories.contains(categoryId);
        },
      ).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: ((ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
             // removeItem: removeMeal,
            );
          }),
          itemCount: displayedMeals.length,
        ));
  }
}
