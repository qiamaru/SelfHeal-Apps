import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/game/Day1/physic1/physic1.dart';
import 'package:test_firebaseauth/game/Day1/psycho1/psycho1.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/game/Day3/cognitive3/cognitive3.dart';
import 'package:test_firebaseauth/game/Day3/meditate3/meditate3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Day3 extends StatefulWidget {
  const Day3({super.key});

  @override
  State<Day3> createState() => _Day3State();
}

class _Day3State extends State<Day3> {
  Future methodDay3() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    SharedPreferences pref = await SharedPreferences.getInstance();
    var determiner = ((pref.getInt('firstday$uid')! + 2) % 7);
    print(determiner);
     if (determiner == 0) {
      determiner = 7;
    }

    if ( DateTime.now().weekday == determiner) {
      pref.setBool('entered3$uid', true);
      ref.update({"entered3": true});
    }

    if (pref.containsKey('entered3$uid') &&
        (pref.getInt('stateDay3$uid') == 0 ||
            !pref.containsKey('stateDay3$uid'))) {
      context.read<Status>().chg('d3', 1, uid);
    } else if (pref.containsKey('entered3$uid') &&
        (pref.getInt('stateDay3$uid') != 0 &&
            pref.containsKey('stateDay3$uid'))) {
      context.read<Status>().chg('d3', pref.getInt('stateDay3$uid')!, uid);
    } else {
      context.read<Status>().chg('d3', 0, uid);
    }
  }

  // Future methodDay3() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var determiner = ((pref.getInt('UIDfirstday')! + 2) % 7);
  //   if (determiner == 0) {
  //     if (pref.getInt('currentDay') == 7) {
  //       context.read<Status>().chg('d3', 1);
  //     }
  //   } else {
  //     if (pref.getInt('currentDay') == determiner) {
  //       context.read<Status>().chg('d3', 1);
  //     }
  //   }
  // }

  @override
  void initState() {
    methodDay3();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      children: [
        tasktop(
            context,
            context.watch<Status>().stat3,
            //context.read<IsNotGreen>().chg,
            Provider.of<IsNotGreen>(context)),
        taskcenter(context.watch<Status>().stat3),
        taskbottom(context, context.watch<Status>().stat3,
            Provider.of<IsNotGreen>(context).isnotgreen),
      ],
    );
    //);
  }

  dynamic tasktop(context, st, ing) {
    switch (st) {
      //allgrey
      case 0:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grey'),
                ],
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
      //1yellow3grey
      case 1:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              // Cognitive1(status: 1, callbackFunction: callback)),
                              const Cognitive3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.yellow[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('ylw'),
                ],
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
      //1green1yellow2grey
      case 2:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cognitive3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Meditate3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.yellow[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
      //2green1yellow1grey
      case 3:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cognitive3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Meditate3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
      //3green1yellow
      case 4:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cognitive3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Meditate3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
      //all green
      case 5:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cognitive3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/cognitive.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Meditate3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/meditate.png'),
                    ),
                  )),
            ],
          );
        }
    }
  }

  dynamic taskcenter(st) {
    switch (st) {
      case 0: //allgrey
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [
                          for (int i = 1; i < 7; i++) guidedot('grey')
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('grey')],
                  ),
                ],
              ),
            ),
          );
        }
      case 1: //1y3grey
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [
                          for (int i = 1; i < 7; i++) guidedot('grey')
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('grey')],
                  ),
                ],
              ),
            ),
          );
        }
      case 2: //1green1yellow2grey
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [
                          for (int i = 1; i < 7; i++) guidedot('grey')
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('ylw')],
                  ),
                ],
              ),
            ),
          );
        }
      case 3: //2green1yelw1grey
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [
                          for (int i = 1; i < 7; i++) guidedot('grey')
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('grn')],
                  ),
                ],
              ),
            ),
          );
        }
      case 4: //3green 1yellow
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [for (int i = 1; i < 7; i++) guidedot('ylw')],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('grn')],
                  ),
                ],
              ),
            ),
          );
        }
      case 5:
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        children: [for (int i = 1; i < 7; i++) guidedot('grn')],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xff22311D),
                        radius: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Day',
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          ),
                          Text('3',
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white))
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    children: [for (int i = 1; i < 7; i++) guidedot('grn')],
                  ),
                ],
              ),
            ),
          );
        }
    }
  }

  dynamic taskbottom(context, st, ing) {
    switch (st) {
      case 0:
        {
          //1y3grey
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grey'),
                ],
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
      case 1:
        {
          //1y3grey
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grey'),
                ],
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
      case 2:
        {
          //1green1yellow2grey
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grey'),
                ],
              ),
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
      case 3:
        {
          //2green1yellow1grey
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      disabledBackgroundColor: Colors.grey[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('ylw'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(true);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Physic1(
                                  id: "d3",
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.yellow[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
      case 4:
        {
          //3green1yellow
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Psycho1(
                                id: 'd3',
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.yellow[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<IsNotGreen>(context, listen: false).chg(false);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Physic1(
                                  id: "d3",
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
      case 5:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Psycho1(
                                id: 'd3',
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/psycho.png'),
                    ),
                  )),
              Wrap(
                spacing: 5,
                children: [
                  for (int i = 1; i < 7; i++) guidedot('grn'),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Physic1(
                                  id: "d3",
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(110, 100),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.green[600]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 35,
                      child: Image.asset('images/physic.png'),
                    ),
                  )),
            ],
          );
        }
    }
  }
}
