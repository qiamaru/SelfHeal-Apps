import 'package:flutter/material.dart';
import 'package:test_firebaseauth/game/Day1/cognitive1/homepuzzle.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';

class Cognitive1 extends StatefulWidget {
  const Cognitive1({super.key});

  @override
  State<Cognitive1> createState() => _Cognitive1State();
}

class _Cognitive1State extends State<Cognitive1> {
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
              padding: EdgeInsets.symmetric(vertical: 14),
              child:
                  Image.asset('images/logoappBar.png', fit: BoxFit.fitHeight)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const PuzzleGame());
  }
}
