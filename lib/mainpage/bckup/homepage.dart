import 'package:flutter/material.dart';
// import 'package:test_firebaseauth/function/taskstatus.dart';

import 'package:test_firebaseauth/mainpage/day1.dart';
import 'package:test_firebaseauth/mainpage/day2.dart';
import 'package:test_firebaseauth/mainpage/day3.dart';
import 'package:test_firebaseauth/mainpage/day4.dart';
import 'package:test_firebaseauth/mainpage/day5.dart';
import 'package:test_firebaseauth/mainpage/day6.dart';
import 'package:test_firebaseauth/mainpage/day7.dart';
import 'package:test_firebaseauth/profilepage.dart';
import 'package:test_firebaseauth/mainpage/journalpage.dart';
import 'package:test_firebaseauth/provider/currentpage_provider.dart';

import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Size get screenSize => MediaQuery.of(context).size;

  final PageController _pagecontroller = PageController();
  //int _index = 0;

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 5),
                  child: IconButton(
                      onPressed: () {},
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
