import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_firebaseauth/mainpage/homepage.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/game/Day1/cognitive1/cognitive1.dart';
//import 'package:test_firebaseauth/game/Day1/meditate1/meditate1.dart';
import 'package:test_firebaseauth/game/Day1/physic1/physic1.dart';
import 'package:test_firebaseauth/game/Day1/psycho1/psycho1.dart';
import 'package:test_firebaseauth/game/Day1/meditate1/meditate1.dart';


class Day1 extends StatefulWidget {
  const Day1({super.key});

  @override
  State<Day1> createState() => _Day1State();
}

class _Day1State extends State<Day1> {
  @override
  Widget build(BuildContext context) =>
      // Scaffold(
      //       body:
      ListView(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          // tasktop(context, status, callback),
          // taskcenter(status),
          // taskbottom(context, status),
          tasktop(
              context,
              context.watch<Status>().stat,
              //context.read<IsNotGreen>().chg,
              Provider.of<IsNotGreen>(context)),
          taskcenter(context.watch<Status>().stat),
          taskbottom(context, context.watch<Status>().stat,
              Provider.of<IsNotGreen>(context).isnotgreen),
        ],
      );
  //);
}

dynamic tasktop(context, st, ing) {
  switch (st) {
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
                            Cognitive1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.yellow[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/cognitive.png'),
                    radius: 35,
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
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/meditate.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Cognitive1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/cognitive.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Meditate1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.yellow[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/meditate.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Cognitive1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/cognitive.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Meditate1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/meditate.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Cognitive1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/cognitive.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Meditate1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/meditate.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Cognitive1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/cognitive.png'),
                    radius: 35,
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
                    MaterialPageRoute(builder: (context) => Meditate1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/meditate.png'),
                    radius: 35,
                  ),
                )),
          ],
        );
      }
  }
}

dynamic taskcenter(st) {
  switch (st) {
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
                    CircleAvatar(
                      backgroundColor: Color(0xff22311D),
                      radius: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        Text('1',
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
                    CircleAvatar(
                      backgroundColor: Color(0xff22311D),
                      radius: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        Text('1',
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
                    CircleAvatar(
                      backgroundColor: Color(0xff22311D),
                      radius: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        Text('1',
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
                    CircleAvatar(
                      backgroundColor: Color(0xff22311D),
                      radius: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        Text('1',
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
                    CircleAvatar(
                      backgroundColor: Color(0xff22311D),
                      radius: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Day',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        Text('1',
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
    case 1:
      {
        //1y3grey
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/psycho.png'),
                    radius: 35,
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
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/physic.png'),
                    radius: 35,
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
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/psycho.png'),
                    radius: 35,
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
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/physic.png'),
                    radius: 35,
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
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    disabledBackgroundColor: Colors.grey[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/psycho.png'),
                    radius: 35,
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
                        builder: (context) => Physic1(
                              id: "d1",
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.yellow[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/physic.png'),
                    radius: 35,
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
                        builder: (context) => Psycho1(
                              id: 'd1',
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.yellow[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/psycho.png'),
                    radius: 35,
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
                              id: "d1",
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/physic.png'),
                    radius: 35,
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
                        builder: (context) => Psycho1(
                              id: 'd1',
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/psycho.png'),
                    radius: 35,
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
                          builder: (context) => Physic1(
                                id: "d1",
                              )));
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(110, 100),
                    shape: CircleBorder(),
                    backgroundColor: Colors.green[600]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Image.asset('images/physic.png'),
                    radius: 35,
                  ),
                )),
          ],
        );
      }
  }
}
