import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        print('Sem Resultado!');
      } else {
        print('O nome da refeição é: $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6.0),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6.0),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6.0),
                      Text(meal.costText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
