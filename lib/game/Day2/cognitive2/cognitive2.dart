import 'package:flutter/material.dart';

// import 'package:mirulhotline/game/Day1/cognitive1/mainc.dart';
// import 'package:mirulhotline/game/Day2/cognitive2/homepuzzle.dart';



import 'package:provider/provider.dart';

import 'mainc.dart';


class Cognitive2 extends StatefulWidget {
  const Cognitive2({super.key});

  @override
  State<Cognitive2> createState() => _Cognitive2State();
}

class _Cognitive2State extends State<Cognitive2> {
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
        body: const SudokuPage());
  }
}

//  ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d2', 2);
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