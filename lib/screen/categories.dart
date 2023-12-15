import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widget/category_list.dart';
import 'package:meals/widget/drawer_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      drawer: Drawer(
        width: 250,
        shape: const BeveledRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Meal App',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            
            const SizedBox(height: 10),
            const DrawerItem(itemName: 'Categories', itemIcon: Icon(Icons.restaurant),),
            const Divider(indent: 5, endIndent: 5),
            const DrawerItem(itemName: 'Favourites', itemIcon: Icon(Icons.favorite_rounded),),
            const Divider(indent: 5, endIndent: 5),
            const DrawerItem(itemName: 'Filters', itemIcon: Icon(Icons.settings),),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),

      body: GridView(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
            )
        ],
      ),
    );
  }
}
