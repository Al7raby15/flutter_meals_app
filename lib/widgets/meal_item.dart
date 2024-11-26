import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = MediaQuery.of(context).size.width;
      print('width: $width');
      final height = MediaQuery.of(context).size.height;
      print('height: $height');

      // print(constraints.minWidth);
      // print(constraints.maxWidth);
      // print(constraints.minHeight);
      // print(constraints.maxHeight);

      return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        margin: const EdgeInsetsDirectional.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => MealDetailsScreen(
                          meal: meal,
                        )));
          },
          child: Stack(children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl, scale: 0.1),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        meal.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.av_timer_rounded,
                            label: '${meal.duration} min',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MealItemTrait(
                            icon: Icons.work,
                            label: complexityText,
                          ),
                          MealItemTrait(
                            icon: Icons.monetization_on_outlined,
                            label: affordabilityText,
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ]),
        ),
      );
    });
  }
}
