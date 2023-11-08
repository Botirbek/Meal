import 'package:expenses/models/meal.dart';
import 'package:expenses/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.mealList});

  final String title;
  final List<Meal> mealList;

  void _selectMeal(BuildContext context) {
    Navigator.of(context).push(
     MaterialPageRoute(
       builder: (context) => Meal,)
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (context, index) =>
          MealItem(meal: mealList[index], onSelectMeal: _selectMeal(context)),
    );

    if (mealList.isEmpty) {
      content = Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Nothing to display'),
        const SizedBox(height: 16),
        Text('Selecting a different category! ', style: Theme
            .of(context)
            .textTheme
            .bodyLarge!
            .copyWith(
          color: Theme
              .of(context)
              .colorScheme
              .onBackground,
        ),)
      ],),);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
