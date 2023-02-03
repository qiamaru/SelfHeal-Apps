import 'package:flutter/material.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'beadhome4.dart';

class Meditate7 extends StatefulWidget {
  const Meditate7({super.key});

  @override
  State<Meditate7> createState() => _Meditate7State();
}

class _Meditate7State extends State<Meditate7> {
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
        body: PrayerBeads4());
  }
}

// ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d7', 3);
//                   context.read<IsNotGreen>().chg(true);
//                 }
//                 // else
//                 //   print('xmasukpon');
//                 Navigator.of(context).pop();
//               }),
//               child: Text('OK done'))