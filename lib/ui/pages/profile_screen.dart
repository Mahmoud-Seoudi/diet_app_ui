import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:diet_app/model/meal.dart';
import 'package:diet_app/ui/pages/meal_detail_screen.dart';
import 'package:diet_app/ui/pages/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final today = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
        child: BottomNavigationBar(
          iconSize: 25.0,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: screenHeight * 0.30,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40.0),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: 40.0,
                  left: 32.0,
                  right: 16.0,
                  bottom: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat('EEEE').format(today)}, ${DateFormat('d MMM yyyy').format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                      subtitle: Text(
                        'Hello, Mahmoud',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(child: Image.asset('assets/user.jpg')),
                    ),
                    // SizedBox(
                    //   height: 5.0,
                    // ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          progress: 0.7,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _IngredientProgress(
                              ingredient: 'Protein',
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: screenWidth * 0.4,
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            _IngredientProgress(
                              ingredient: 'Carbs',
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: screenWidth * 0.4,
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            _IngredientProgress(
                              ingredient: 'Fat',
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount: 61,
                              width: screenWidth * 0.4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.32,
            left: 0,
            right: 0,
            child: Container(
              // color: Colors.grey,    //////////
              height: screenHeight * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      left: 32.0,
                      right: 16.0,
                    ),
                    child: Text(
                      'MEALS FOR TODAY',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32.0,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            _MealsCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0.0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: Duration(milliseconds: 1000),
                      closedColor: Color(0xFFE9E9E9),
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 10.0,
                              left: 32.0,
                              right: 32.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                30.0,
                              )),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    left: 16.0,
                                  ),
                                  child: Text(
                                    'YOUR NEXT WORKOUT',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4.0,
                                    left: 16.0,
                                  ),
                                  child: Text(
                                    'Upper Body',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/chest.png',
                                          width: 50.0,
                                          height: 50.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/back.png',
                                          width: 50.0,
                                          height: 50.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/biceps.png',
                                          width: 50.0,
                                          height: 50.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress({
    Key key,
    this.ingredient,
    this.leftAmount,
    this.progress,
    this.width,
    this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10.0,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10.0,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({
    Key key,
    this.height,
    this.width,
    this.progress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '1731',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF200087),
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'kcal left',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
        // color: Colors.grey,
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 7
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    // canvas.drawCircle(center, size.width / 2, paint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress), //   الاشارة لوضع الدائرة
      false, ////    بيظهر الوتر لطرفي الدائرة
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

////////////////////////////////////////////////

class _MealsCard extends StatelessWidget {
  final Meal meal;

  const _MealsCard({Key key, this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.0,
        bottom: 5.0,
      ),
      // child: GestureDetector(
      //   onTap: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => MealDetailScreen(
      //               meal: meal,
      //             )));
      //   },
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                  closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  transitionDuration: Duration(milliseconds: 1000),
                  openBuilder: (context, _) {
                    return MealDetailScreen(
                      meal: meal,
                    );
                  },
                  closedBuilder: (context, openContainer) {
                    return GestureDetector(
                      onTap: openContainer,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset(
                          meal.imagePath,
                          width: 150,
                          // height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      meal.mealTime,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${meal.kiloCaloriesBurnt} kcal',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.black12,
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${meal.timeTaken} min',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
