import 'dart:ui';

import 'package:diet_app/model/upper_body_workout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMM yyyy").format(today)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Upper Body',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.white38,
                        ),
                        Text(
                          '60 min',
                          style: TextStyle(
                            color: Colors.white70,
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
                          Icons.shutter_speed,
                          color: Colors.white38,
                        ),
                        Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ///////////////////////////////////////
              SizedBox(
                height: 20.0,
              ),
              for (int i = 0; i < upperBody.length; i++)
                Column(
                  children: <Widget>[
                    for (int j = 0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Color(0xFF5B4D9D),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              upperBody[i][j].imagePath,
                              width: 40.0,
                              height: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
