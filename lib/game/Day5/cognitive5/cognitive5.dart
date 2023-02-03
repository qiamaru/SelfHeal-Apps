import 'package:flutter/material.dart';
import 'package:test_firebaseauth/game/Day5/cognitive5/homepuzzle.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';

class Cognitive5 extends StatefulWidget {
  const Cognitive5({super.key});

  @override
  State<Cognitive5> createState() => _Cognitive5State();
}

class _Cognitive5State extends State<Cognitive5> {
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

//  ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d5', 2);
//                   context.read<IsNotGreen>().chg(true);
//                   // print('${context.watch<IsNotGreen>().isnotgreen}');
//                   print(Provider.of<IsNotGreen>(context, listen: false)
//                       .isnotgreen);
//                 }
//                 // if (context.watch<Status>().stat >= 5) {
//                 //   context.read<Status>().chg(2);
//                 // }
//                 Navigator.of(context).pop();
//               }),
//               child: Text('OK done'))