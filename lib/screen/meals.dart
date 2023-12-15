import 'package:flutter/material.dart';
import 'package:meals/widget/meal_item_list.dart';
import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index]
      ),
    );

    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text('Uh oh.. Nothing Here', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
            SizedBox(height: 10),
            Text('Try selecting different Category.', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
