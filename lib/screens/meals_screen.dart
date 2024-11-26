import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      required this.title,
      });

  final List<Meal> meals;
  final String title;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, int index) => MealItem(
              meal: meals[index],
            ));

    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   title,
            //   style: const TextStyle(
            //     color: Colors.white,
            //   ),
            // ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Uh oh .... There is no List of Meals',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Try another Catergory!',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
        ),
      ),
      body: content,
    );
  }
}

 // ListView.builder(
    //   itemCount: meals.length,
    //   itemBuilder: (ctx, int index) {
    //     return Column(
    //       children: [
    //         Image.network(meals[index].imageUrl),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               meals[index].title,
    //               style: const TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 8,
    //             ),
    //             Text(
    //               meals[index].duration.toString(),
    //               style: const TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             const Text(
    //               'seconds',
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             const SizedBox(
    //               width: 8,
    //             ),
    //             const Text('Affordability:',
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                 )),
    //             const SizedBox(
    //               width: 8,
    //             ),
    //             Text(meals[index].affordability.name,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                 )),
    //             const SizedBox(
    //               width: 8,
    //             ),
    //             const Text('Complexity: ',
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                 )),
    //             const SizedBox(
    //               width: 8,
    //             ),
    //             Text(meals[index].complexity.name,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                 )),
    //           ],
    //         ),
    //         const Text(
    //           'Ingredients: ',
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         ),
    //         for (final ingredients in meals[index].ingredients)
    //           Text(
    //             ingredients,
    //             style: const TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //         const Text(
    //           'Steps: ',
    //           style: TextStyle(
    //             color: Colors.white,
    //           ),
    //         ),
    //         for (final step in meals[index].steps)
    //           Text(
    //             step,
    //             style: const TextStyle(
    //               color: Colors.white,
    //             ),
    //           ),
    //       ],
    //     );
    //   },
    // );