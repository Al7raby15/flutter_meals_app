import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/widgets/meal_detail.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      body: Center(child: MealDetail(meal: meal)),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .onToggleFavorite(meal);

                ScaffoldMessenger.of(context).clearSnackBars();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      wasAdded
                          ? 'you have added a meal to favorite'
                          : 'meal was removed from favorite',
                    ),
                  ),
                );
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border))
        ],
        title: Text(meal.title),
      ),
    );
  }
}
