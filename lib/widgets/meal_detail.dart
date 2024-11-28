import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    // i
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl, scale: 0.1),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Steps:',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Ingredients:',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
