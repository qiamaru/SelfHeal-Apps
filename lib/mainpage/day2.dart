import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/game/Day1/physic1/physic1.dart';
import 'package:test_firebaseauth/game/Day1/psycho1/psycho1.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/game/Day2/cognitive2/cognitive2.dart';
import 'package:test_firebaseauth/game/Day2/meditate2/meditate2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Day2 extends StatefulWidget {
  const Day2({super.key});

  @override
  State<Day2> createState() => _Day2State();
}

class _Day2State extends State<Day2> {
  Future methodDay2() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    SharedPreferences pref = await SharedPreferences.getInstance();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    var determiner = ((pref.getInt('firstday$uid')! + 1) % 7);
     if (determiner == 0) {
      determiner = 7;
    }

    // print(pref.containsKey('entered2$uid'));
    print(pref.getInt('stateDay2$uid'));
    // pref.remove('stateDay2$uid');
    // pref.remove('entered2$uid');

    if (DateTime.now().weekday == determiner) {
      pref.setBool('entered2$uid', true);
      ref.update({"entered2": true});
    }

    if (pref.containsKey('entered2$uid') &&
        (pref.getInt('stateDay2$uid') == 0 ||
            !pref.containsKey('stateDay2$uid'))) {
      context.read<Status>().chg('d2', 1, uid);
    } else if (pref.containsKey('entered2$uid') &&
        (pref.getInt('stateDay2$uid') != 0 &&
            pref.containsKey('stateDay2$uid'))) {
      context.read<Status>().chg('d2', pref.getInt('stateDay2$uid')!, uid);
    } else {
      context.read<Status>().chg('d2', 0, uid);
    }

    // if (!pref.containsKey('entered2$uid')) {
    //   if (determiner == 0) {
    //     if (DateTime.now().weekday == 7) {
    //       context.read<Status>().chg('d2', 1, uid);
    //       pref.setBool('entered2$uid', true);
    //       print('ubah jadi true sbb day same ngan 7');
    //     }
    //   } else {
    //     if (DateTime.now().weekday == determiner) {
    //       context.read<Status>().chg('d2', 1, uid);
    //       pref.setBool('entered2$uid', true);
    //       print('ubah jadi true sebab day sama ngan determiner');
    //     }
    //   }
    //   // pref.setBool('entered2', false);
    // } else {
    //   //set according to last state that user save in ${stDay2UID} (int)
    //   if (pref.containsKey('stateDay2$uid')) {
    //     setState(() {
    //       context.read<Status>().chg('d2', pref.getInt('stateDay2$uid')!, uid);
    //     });
    //   } else {
    //     print('x pernah ada stateDay2');
    //     // context.read<Status>().chg('d2', 1, uid);
    //   }
    // }
  }

  @override
  void initState() {
    methodDay2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        tasktop(
            context,
            context.watch<Status>().stat2,
            //context.read<IsNotGreen>().chg,
            Provider.of<IsNotGreen>(context)),
        taskcenter(context.watch<Status>().stat2),
        taskbottom(context, context.watch<Status>().stat2,
            Provider.of<IsNotGreen>(context).isnotgreen),
      ],
    );

    //);
  }
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
                            const Cognitive2()),
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
                    MaterialPageRoute(builder: (context) => const Cognitive2()),
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
                    MaterialPageRoute(builder: (context) => const Meditate2()),
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
                    MaterialPageRoute(builder: (context) => const Cognitive2()),
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
                    MaterialPageRoute(builder: (context) => const Meditate2()),
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
                    MaterialPageRoute(builder: (context) => const Cognitive2()),
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
                    MaterialPageRoute(builder: (context) => const Meditate2()),
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
                    MaterialPageRoute(builder: (context) => const Cognitive2()),
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
                    MaterialPageRoute(builder: (context) => const Meditate2()),
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
                      children: [for (int i = 1; i < 7; i++) guidedot('grey')],
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                      children: [for (int i = 1; i < 7; i++) guidedot('grey')],
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                      children: [for (int i = 1; i < 7; i++) guidedot('grey')],
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                      children: [for (int i = 1; i < 7; i++) guidedot('grey')],
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                        Text('2',
                            style: TextStyle(fontSize: 60, color: Colors.white))
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
                                id: 'd2',
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
                              id: 'd2',
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
                                id: 'd2',
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
                              id: 'd2',
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
                                id: 'd2',
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
