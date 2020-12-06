import 'dart:ui';

import 'package:diet_app/model/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: Color(0xFF200087),
            expandedHeight: 300.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40.0)),
                child: Image.asset(
                  meal.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  title: Text(
                    meal.mealTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "${meal.kiloCaloriesBurnt} kcal",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                          ),
                          Text(
                            "${meal.timeTaken} mins",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Igredients :',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (int i = 0; i < meal.ingredients.length; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 4.0,
                          ),
                          child: Text(
                            meal.ingredients[i],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Preparation :',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w800,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    bottom: 32.0,
                  ),
                  child: Text(
                    meal.preparation,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
