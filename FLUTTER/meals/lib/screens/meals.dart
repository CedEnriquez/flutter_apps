import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,this.title, required this.meals,});

  final String? title;
  final List<Meal> meals;
 

  void selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
    MealDetailsScreen(meal: meal ,)
    
    ),);

  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
        return  MealItem(onSelectMeal: (meal){
          selectMeal(context, meal);
        } ,
            meal: meals[index],
          );
        });

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          children: [
            Text(
              'Uh oh! Nothing Here',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try Selecting A different Category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            )
          ],
        ),
      );
    }
    if (title == null){
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
