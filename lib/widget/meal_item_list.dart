import 'package:flutter/material.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import '../model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  // Accessing enum functionc
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,

      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => 
            MealDetailsScreen(
              meal: meal
            )
          ));
        },

        child: Stack(
          children: [
            Hero(
              tag: meal.imageUrl,
              child: FadeInImage(
                height: 230,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: const Color.fromARGB(150, 50, 50, 50),
                  padding:const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis, // if text is very long then it will end with ...
                        style: const TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        height: 2,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule, 
                            label: '${meal.duration} min',// meal.duration.toString() + ' min'
                          ),
                          const SizedBox(width: 20),
                          MealItemTrait(
                            icon: Icons.cookie_outlined, 
                            label: complexityText,
                          ),
                          const SizedBox(width: 20),
                          MealItemTrait(
                            icon: Icons.monetization_on_outlined, 
                            label: affordabilityText,
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
