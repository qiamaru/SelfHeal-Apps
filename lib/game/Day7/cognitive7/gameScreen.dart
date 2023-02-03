import 'dart:async';

import 'package:flutter/material.dart';
import '/game/Day7/cognitive7/pages/countDownScreen.dart';
import '/game/Day7/cognitive7/pages/tapiconScreen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // int count = 0;
  int _start = 3;
  int index = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1200), (Timer timer) {
      if (_start < 1) {
        setState(() {
          timer.cancel();
          index++;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List _pages = [
      CountDownScreen(
        countDown: _start,
      ),
      TapiconScreen(
        screenWidth: MediaQuery.of(context).size.width,
      ),
    ];
    return Scaffold(
      body: _pages[index],
    );
  }
}
