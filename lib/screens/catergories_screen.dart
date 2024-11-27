import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CatergoriesScreen extends StatefulWidget {
  const CatergoriesScreen({super.key, required this.avaliableMeals});

  final List<Meal> avaliableMeals;

  @override
  State<CatergoriesScreen> createState() => _CatergoriesScreenState();
}

class _CatergoriesScreenState extends State<CatergoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: const Duration(milliseconds: 300));

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              avialableMeals: widget.avaliableMeals,
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ),
        ),
        child: child,
      ),
    );
  }
}
