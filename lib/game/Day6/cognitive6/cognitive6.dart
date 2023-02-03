import 'package:flutter/material.dart';
import 'slidepuzzle.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';

class Cognitive6 extends StatefulWidget {
  const Cognitive6({super.key});

  @override
  State<Cognitive6> createState() => _Cognitive6State();
}

class _Cognitive6State extends State<Cognitive6> {
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
        body: SlidePuzzle());
  }
}

// ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d6', 2);
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