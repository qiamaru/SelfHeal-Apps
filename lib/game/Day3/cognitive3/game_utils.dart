import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.orange,
    Colors.orange,
    Colors.red,
    Colors.red,
    Colors.purple,
    Colors.purple,
  ];
  final String hiddenCardpath = "assets/day3-memorycard/hidden.png";
  List<String> cards_list = [
    "assets/day3-memorycard/square.png",
    "assets/day3-memorycard/circle.png",
    "assets/day3-memorycard/triangle.png",
    "assets/day3-memorycard/hexagon.png",
    "assets/day3-memorycard/circle.png",
    "assets/day3-memorycard/square.png",
    "assets/day3-memorycard/heart.png",
    "assets/day3-memorycard/star.png",
    "assets/day3-memorycard/triangle.png",
    "assets/day3-memorycard/treble.png",
    "assets/day3-memorycard/star.png",
    "assets/day3-memorycard/heart.png",
    "assets/day3-memorycard/hexagon.png",
    "assets/day3-memorycard/apple.png",
    "assets/day3-memorycard/treble.png",
    "assets/day3-memorycard/apple.png",
  ];
  final int cardCount = 16; //asal 16
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
