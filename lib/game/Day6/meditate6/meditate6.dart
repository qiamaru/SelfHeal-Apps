import 'package:flutter/material.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'watchquran.dart';
// import 'package:provider/provider.dart';
// import 'package:mirulhotline/provider/status_provider.dart';
// import 'package:mirulhotline/provider/isnotgreen_provider.dart';

class Meditate6 extends StatefulWidget {
  const Meditate6({super.key});

  @override
  State<Meditate6> createState() => _Meditate6State();
}

class _Meditate6State extends State<Meditate6> {
  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
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
        body: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: AppBar(
                  backgroundColor: Color(0xff8AD16A),
                  toolbarHeight: divHeight,
                  title: Container(
                    width: divWidth * .45,
                    decoration: BoxDecoration(
                      color: Color(0XffD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 1,
                            child: Image.asset('images/meditate.png',
                                fit: BoxFit.fitHeight)),
                        const Flexible(
                            flex: 3,
                            child: Text(
                              'Spiritual',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                )),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Let\'s Hear Beautiful Quran Recitation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Surah as-Sajdah',
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30), textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WatchQuran())));
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Watch',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    // letterSpacing: 1,
                                    fontSize: 26,
                                    color: Colors.white),
                              )),
                        ),
                      ))
                ]))));
  }
}

// ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d6', 3);
//                   context.read<IsNotGreen>().chg(true);
//                 }
//                 // else
//                 //   print('xmasukpon');
//                 Navigator.of(context).pop();
//               }),
//               child: Text('OK done'))