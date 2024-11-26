import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum Filters {
  gultenFree,
  lactoseFree,
  vagentarianFree,
  vaganFree,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.gultenFree: false,
          Filters.lactoseFree: false,
          Filters.vagentarianFree: false,
          Filters.vaganFree: false,
        });

  void setFilters(Map<Filters, bool> m) {
    state = m;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMeals = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filterM = ref.watch(filterProvider);
  return meals.where((meal) {
    if (filterM[Filters.gultenFree]! && meal.isGlutenFree) {
      return false;
    }
    if (filterM[Filters.lactoseFree]! && meal.isLactoseFree) {
      return false;
    }
    if (filterM[Filters.vagentarianFree]! && meal.isVegetarian) {
      return false;
    }
    if (filterM[Filters.vaganFree]! && meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
  
});
