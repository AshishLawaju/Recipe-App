import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/screen/categories_screen.dart';
import 'package:mealapp/screen/favorite_screen.dart';
import 'package:mealapp/screen/meal_detail_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> pages = [
    {
      'page': CategoriesScreen(),
      'title': 'category',
    },
    {'page': FavoriteScreen(), 'title': 'Favorite'}
  ];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectPage(value);
        },
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: pages[selectedPageIndex]['title'] as String),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: pages[selectedPageIndex]['title'] as String)
        ],
      ),
    );
  }
}






//  return DefaultTabController(
//       length: 2,initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: 'Favorite',
//             )
//           ]),
//         ),

//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoriteScreen()

//         ]),
//       ),
//     );
//   }
// }
