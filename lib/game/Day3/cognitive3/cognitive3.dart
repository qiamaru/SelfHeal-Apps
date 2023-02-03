import 'package:flutter/material.dart';
import 'memoryhome.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';

class Cognitive3 extends StatefulWidget {
  const Cognitive3({super.key});

  @override
  State<Cognitive3> createState() => _Cognitive3State();
}

class _Cognitive3State extends State<Cognitive3> {
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
        body: const MemoryCard());
  }
}

// ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d3', 2);
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