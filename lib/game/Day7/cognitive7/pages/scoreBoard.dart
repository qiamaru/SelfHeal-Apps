import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tapgame/app/pages/startScreen2.dart';
// import 'package:tapgame/app/pages/startScreen.dart';
import 'startScreen.dart';

// import '../../gameScreen.dart';
import '../gameScreen.dart';

class ScoreBoard extends StatefulWidget {
  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int highestScore = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchhScore();
  }

  Future<void> fetchhScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      highestScore = sharedPreferences.getInt("highscore2")!;
      score = sharedPreferences.getInt("score2")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          // width: MediaQuery.of(context).size.width / 1.5,
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: _buildUserScoreBoard(context),
          ),
        ),
      ),
      // floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Column _buildUserScoreBoard(BuildContext context) {
    return Column(
      children: [
        Text(
          'You\'re almost there!\nKeep Going.',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),
          textAlign: TextAlign.center,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Text(
                "Score",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                score.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                "Highscore: ${highestScore.toString()}",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Text(
            'Target: 15',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton.icon(
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
              icon: Icon(Icons.replay),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Try Again',
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton.icon(
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => StartScreen()));
                Navigator.of(context).pop();
                // Navigator.of(context).pop();
              },
              icon: Icon(Icons.exit_to_app_rounded),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Exit',
                  style: TextStyle(fontSize: 20),
                ),
              )),
        )
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
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
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => GameScreen()));
      },
      child: Icon(
        Icons.play_arrow,
        size: 28,
        color: Colors.pink,
      ),
    );
  }
}
