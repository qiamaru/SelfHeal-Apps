import 'package:flutter/material.dart';
import '../gameScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int? highestScore = 0;
  @override
  void initState() {
    super.initState();
    fetchhScore();
  }

  Future<void> fetchhScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      highestScore = sharedPreferences.getInt("highscore2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          // alignment: Alignment,
          // width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: _userScoreBoard(),
          ),
        ),
      ),

      // floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      onPressed: () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
              pageBuilder: (BuildContext context,
                      Animation<double> firstAnimation,
                      Animation<double> secondAnimation) =>
                  GameScreen(),
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondAnimation,
                  Widget child) {
                var begin = Offset(100.0, 0.0);
                var end = Offset.zero;
                Curve curve = Curves.easeInCirc;

                var tween = Tween(begin: begin, end: end)
                  ..chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              }),
        );
      },
    );
  }

  Column _userScoreBoard() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Welcome to the last game of cognitive! This time, let's test your brain reflex with a simple Tap Game."
                  "\n\nThe rule is simple. You have to tap the screen until you successfully reach the target (15)."
                  "\n\nIf you are ready tap the play button.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                                  Animation<double> firstAnimation,
                                  Animation<double> secondAnimation) =>
                              GameScreen(),
                          transitionDuration: Duration(milliseconds: 500),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondAnimation,
                              Widget child) {
                            var begin = Offset(100.0, 0.0);
                            var end = Offset.zero;
                            Curve curve = Curves.easeInCirc;

                            var tween = Tween(begin: begin, end: end)
                              ..chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          }),
                    );
                  },
                  icon: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 60,
                    color: Colors.pink,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
