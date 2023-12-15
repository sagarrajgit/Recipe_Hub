import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../model/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;
  
  @override
  Widget build(BuildContext context) {

  void showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text(message),
        duration: const Duration(seconds: 1),
      )
    );
  }
  
  Icon favouriteIcon=const Icon(Icons.favorite_outline_rounded);
  void onToggleFavourite(Meal meal) {
    final bool isExisting = favouriteItems.contains(meal);

    if (isExisting == true) {
      favouriteItems.remove(meal);
      showInfoMessage('Item removed from Favourite');
    } else {
      favouriteItems.add(meal);
      favouriteIcon=const Icon(Icons.favorite_rounded, color: Colors.red,);
      showInfoMessage('Item added to Favourite');
    }
  }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: ()=> onToggleFavourite(meal), 
            icon: favouriteIcon
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: meal.imageUrl,
              child: Image.network(
                meal.imageUrl,
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            
            for(final ingrediant in meal.ingredients)
              Center(
                child:
                  Text(ingrediant, style: const TextStyle(fontSize: 15))
              ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                'Steps',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),

            for(final step in meal.steps)
              Row(
                children: [
                  const SizedBox(width: 3),
                  const Icon(Icons.circle, size: 10,),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        step,
                        maxLines: 5,
                        softWrap: true,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
