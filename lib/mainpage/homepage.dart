import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:selfheal_prototype/function/taskstatus.dart';

import 'package:test_firebaseauth/mainpage/day1.dart';
import 'package:test_firebaseauth/mainpage/day2.dart';
import 'package:test_firebaseauth/mainpage/day3.dart';
import 'package:test_firebaseauth/mainpage/day4.dart';
import 'package:test_firebaseauth/mainpage/day5.dart';
import 'package:test_firebaseauth/mainpage/day6.dart';
import 'package:test_firebaseauth/mainpage/day7.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

import '../first_time_user/introduction_slide.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  Size get screenSize => MediaQuery.of(context).size;
  int? currentWeekDay;
  //no need to chg date@time bcs it should follow system

  final PageController _pagecontroller = PageController();

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  // //this method should be called only once at disclaimer view and under contain.key cause it relate w UID
  // Future setUIDfirstday() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     if (!sharedPreferences.containsKey('firstday$uid')) {
  //       sharedPreferences.setInt("firstday$uid", DateTime.now().weekday);
  //       print('set firstday untuk pertama kalinya');
  //       // sharedPreferences.reload();
  //     } else {
  //       var daydlmSP = sharedPreferences.getInt("firstday$uid");
  //       print('first day dah pernah ada dah : $daydlmSP');
  //     }
  //   });
  // }

  Future<void> removeSP() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      sharedPrefs.clear();
      // sharedPrefs.remove('currentTheme');
    });
  }

  @override
  void initState() {
    // setUIDfirstday();
    // removeSP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // DatabaseReference readref =
    //     FirebaseDatabase.instance.ref('users/$uid/DASS');
    // readref.onValue.listen((DatabaseEvent event) {
    //   print('Snapshot: ${event.snapshot.child('anxiety').value}');
    //   // final data = event.snapshot.value;
    //   // dass = data;
    // });

    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              actions: [
                // Text(
                //   'now is day ${DateTime.now().weekday}',
                //   style: const TextStyle(color: Colors.black),
                // ),

                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const IntroductionSlide()));
                      },
                      //splashRadius: 25,
                      //alignment: Alignment.centerRight,
                      icon: const Icon(
                        Icons.info_rounded,
                        size: 45,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: PageView(
                    controller: _pagecontroller,
                    children: const [
                      Day1(),
                      Day2(),
                      Day3(),
                      Day4(),
                      Day5(),
                      Day6(),
                      Day7(),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      //height: 20,
                      //color: Colors.red.withOpacity(0.5),
                      child: Center(
                        child: SmoothPageIndicator(
                            controller: _pagecontroller,
                            count: 7,
                            effect: const WormEffect(
                                spacing: 18,
                                dotHeight: 20,
                                dotWidth: 20,
                                radius: 5),
                            onDotClicked: (index) {
                              // context.read<Status>().chg(2);
                              _pagecontroller.animateToPage(index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ))
        //     ],
        //   ),
        // )
        ;
  }
}

dynamic guidedot(String dotcolor) {
  if (dotcolor == 'grn') {
    return CircleAvatar(
      backgroundColor: Colors.green[600],
      radius: 10,
    );
  } else if (dotcolor == 'ylw') {
    return CircleAvatar(
      backgroundColor: Colors.yellow[600],
      radius: 10,
    );
  } else if (dotcolor == 'grey') {
    return CircleAvatar(
      backgroundColor: Colors.grey[600],
      radius: 10,
    );
  }
}
