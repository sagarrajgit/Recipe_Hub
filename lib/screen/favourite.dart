import 'package:flutter/material.dart';
import 'package:meals/widget/meal_item_list.dart';
import '../data/dummy_data.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: favouriteItems.length,
        itemBuilder: (context, index) => MealItem(meal: favouriteItems[index]));

    if (favouriteItems.isEmpty) {
      content = const Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              'Uh oh.. Nothing Here',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              'Try selecting different Category.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: content,
    );
  }
}
