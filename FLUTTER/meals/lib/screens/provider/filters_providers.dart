import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/provider/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}


class Filtersnotifier extends StateNotifier<Map<Filter, bool>>{
  Filtersnotifier(): super({
    Filter.glutenFree:false,
    Filter.lactoseFree:false,
    Filter.vegan:false,
    Filter.vegetarian:false,
  });

  void setFilters(Map<Filter,bool>chosenFilters){
    state= chosenFilters;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filteredMealsProvider = Provider((ref){
     final meals = ref.watch(mealsProvider);
     final activeFilters = ref.watch(filtersProvider);

      return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

});





final filtersProvider = StateNotifierProvider<Filtersnotifier,Map<Filter,bool>>(
  (ref)=> Filtersnotifier());