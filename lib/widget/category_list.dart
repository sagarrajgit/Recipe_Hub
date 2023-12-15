import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../model/category.dart';
import '../screen/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;
  // final void Function() onSelectCategory;


  @override
  Widget build(BuildContext context) {
    
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList(); // toList() is use to convert into list

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
          MealsScreen(
            title: category.title,
            meals: filteredMeals,
          )
        ));
      },
      
      borderRadius: BorderRadius.circular(15),

      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.75),
              category.color.withOpacity(1),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.background)
            ),
      ),
    );
  }
}
