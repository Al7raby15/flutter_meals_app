import 'package:flutter/material.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/screens/catergories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';

const kInitialFilters = {
  Filters.gultenFree: false,
  Filters.lactoseFree: false,
  Filters.vagentarianFree: false,
  Filters.vaganFree: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabScreen> {
  int myIndex = 0;

  void naviOntap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  void onSelectedScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = ref.watch(filteredMeals);

    final favoriteMeal = ref.watch(favoriteMealsProvider);

    final List<Widget> screens = [
      CatergoriesScreen(
        avaliableMeals: avaliableMeals,
      ),
      FavoriteScreen(
        favoriteMeals: favoriteMeal,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: myIndex == 0
            ? const Text('Pick a Catergories')
            : const Text('Favorite List'),
      ),
      drawer: MainDrawer(
        onSelectedScreen: onSelectedScreen,
      ),
      body: screens[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: naviOntap,
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_outlined), label: 'Catergories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
          ]),
    );
  }
}
