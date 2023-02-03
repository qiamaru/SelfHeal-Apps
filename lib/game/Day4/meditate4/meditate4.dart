import 'package:flutter/material.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'gratitude_home.dart';
// import 'package:provider/provider.dart';
// import 'package:mirulhotline/provider/status_provider.dart';
// import 'package:mirulhotline/provider/isnotgreen_provider.dart';

class Meditate4 extends StatefulWidget {
  const Meditate4({super.key});

  @override
  State<Meditate4> createState() => _Meditate4State();
}

class _Meditate4State extends State<Meditate4> {
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
        body: const GratitudeScreen());
  }
}

// ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d4', 3);
//                   context.read<IsNotGreen>().chg(true);
//                 }
//                 // else
//                 //   print('xmasukpon');
//                 Navigator.of(context).pop();
//               }),
//               child: Text('OK done'))