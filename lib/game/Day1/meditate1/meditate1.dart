import 'package:flutter/material.dart';
import 'beadhome.dart';

class Meditate1 extends StatefulWidget {
  const Meditate1({super.key});

  @override
  State<Meditate1> createState() => _Meditate1State();
}

class _Meditate1State extends State<Meditate1> {
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
        body: PrayerBeads());
  }
}

// ElevatedButton( //button at the end of tasbih
          //     onPressed: (() {
          //       if (Provider.of<Status>(context, listen: false).stat != 5 &&
          //           Provider.of<IsNotGreen>(context, listen: false)
          //               .isnotgreen) {
          //         context.read<Status>().chg('d1', 3);
          //         context.read<IsNotGreen>().chg(true);
          //       }
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const Main()),
          //       );
          //     }),
          //     child: Text('OK done'))