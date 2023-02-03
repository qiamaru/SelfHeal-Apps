import 'package:flutter/material.dart';
import 'package:test_firebaseauth/game/Day1/physic1/Exercise/exerciseinfo_screen.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_firebaseauth/game/Day1/physic1/Exercise/startworkout_screen.dart';
import 'package:google_fonts/google_fonts.dart';



import 'Exercise/days_list.dart';
import 'Exercise/exercises_list.dart';

class Physic1 extends StatefulWidget {
  const Physic1({super.key, required this.id});

  // final String selectedDay = 'Day 1';
  // final String exercises = '7';
  // final String time = '4 mins';
  // final String resttime = '30 secs';
  final String id;

  @override
  State<Physic1> createState() => _Physic1State();
}

class _Physic1State extends State<Physic1> {
  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: divHeight / 2 * 0.2,
          title: Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              child:
                  Image.asset('images/logoappBar.png', fit: BoxFit.fitHeight)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ExerciseInfo(id: widget.id));
  }
}
