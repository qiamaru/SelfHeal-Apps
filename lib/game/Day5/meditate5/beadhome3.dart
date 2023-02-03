import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'about.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'animated_flip_counter.dart';

import 'package:provider/provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/badgeDialog/badgeMedDialog.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dart:async';

class PrayerBeads3 extends StatefulWidget {
  @override
  _PrayerBeads3State createState() => _PrayerBeads3State();
}

class _PrayerBeads3State extends State<PrayerBeads3> {
  final String kbcc5 = 'beadsCountc5';
  final String kbrc5 = 'RoundCountc5';
  // final String kImagePath = 'imagePath';
  late SharedPreferences prefs3;
  PageController _controller = PageController(
    viewportFraction: 0.1,
    initialPage: 5,
  );
  final int _numberOfCountsToCompleteRound = 33;
  int _beadCounter = 0;
  int _RoundCounter = 0;
  int _accumulatedCounter = 0;
  bool _canVibrate = true;
  String _imagePath = '';
  bool _isDisposed = false;
  @override
  void initState() {
    SharedPreferences.getInstance().then((SharedPreferences sp2) {
      prefs3 = sp2; // set an initial value
    });
    Timer(
        const Duration(milliseconds: 200),
        () => showAnimatedDialog<void>(
            animationType: DialogTransitionType.fadeScale,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 350),
            context: context,
            builder: (_) => const AlertTip()));
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ))
                ],
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          )),
      body: GestureDetector(
        onTap: () {
          _clicked(_resetEveryThing);
        },
        onVerticalDragStart: (details) {
          _clicked(_resetEveryThing);
        },
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              
              Expanded(
                flex: 1,
                child: Container(
                  child: PageView.builder(
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, position) {
                      return Container(
                        child: Image.asset(
                          'assets/beads/bead-3.png',
                        ),
                      );
                    },
                    itemCount: null,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width: 45),
                            // Builder(builder: (context) {
                            //   return IconButton(
                            //       tooltip: 'About',
                            //       icon: const Icon(Icons.info_outline_rounded),
                            //       onPressed: () {
                            //         setState(() {
                            //           Timer(
                            //               const Duration(milliseconds: 200),
                            //               () => showAnimatedDialog<void>(
                            //                   animationType:
                            //                       DialogTransitionType
                            //                           .fadeScale,
                            //                   barrierDismissible: true,
                            //                   duration: const Duration(
                            //                       milliseconds: 350),
                            //                   context: context,
                            //                   builder: (_) =>
                            //                       const AlertAbout()));
                            //         });
                            //       });
                            // }),
                            Builder(builder: (context) {
                              return IconButton(
                                  tooltip: 'Tip',
                                  icon:
                                      const Icon(Icons.question_mark_outlined),
                                  onPressed: () {
                                    setState(() {
                                      Timer(
                                          const Duration(milliseconds: 200),
                                          () => showAnimatedDialog<void>(
                                              animationType:
                                                  DialogTransitionType
                                                      .fadeScale,
                                              barrierDismissible: true,
                                              duration: const Duration(
                                                  milliseconds: 350),
                                              context: context,
                                              builder: (_) =>
                                                  const AlertTip()));
                                    });
                                  });
                            }),
                            IconButton(
                                tooltip: 'Reset counter',
                                icon: const Icon(Icons.refresh),
                                onPressed: () {
                                  _resetEveryThing();
                                }),
                          ],
                        ),
                        Builder(builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          );
                        }),
                        // const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            _Counter(
                                counter: _RoundCounter, counterName: 'Round'),
                            _Counter(
                                counter: _beadCounter, counterName: 'Beads'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Accumulated'),
                              const SizedBox(width: 10),
                              AnimatedFlipCounter(
                                  value: _accumulatedCounter,
                                  duration: const Duration(milliseconds: 730),
                                  size: 14),
                            ],
                          ),
                        ),
                        Builder(builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.058,
                          );
                        }),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Builder(builder: (context) {
                            return Card(
                              color: Colors.lightBlue.shade50,
                              child: Image.asset(
                                'assets/zikr/3.png',
                                fit: BoxFit.fitWidth,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              elevation: 10,
                            );
                          }),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _loadSettings() async {
    bool? canVibrate = await Vibration.hasVibrator();
    if (!_isDisposed) {
      setState(() {
        _canVibrate = canVibrate!;
        _loadData();
      });
    }
  }

  void _loadData() {
    if (!_isDisposed) {
      setState(() {
        _beadCounter = prefs3.getInt(kbcc5) ?? 0;
        _RoundCounter = prefs3.getInt(kbrc5) ?? 0;
        // _imagePath = prefs3.getString(kImagePath) ?? '';
        _accumulatedCounter =
            _RoundCounter * _numberOfCountsToCompleteRound + _beadCounter;
      });
    }
  }

  void _resetEveryThing() {
    prefs3.setInt(kbcc5, 0);
    prefs3.setInt(kbrc5, 0);
    // prefs3.setString(kImagePath, '');
    _loadData();
  }

  void _clicked(VoidCallback callback) {
    void _confirmResetAction() {
      callback();
    }

    if (!_isDisposed) {
      setState(() {
        if (_accumulatedCounter == 5) {
          //if the end is 16 then 15 should be last because start from 0
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                // backgroundColor: Styles.secondaryBackgroundColor,
                title: Text(
                  'Task Completed',
                  // style: TextStyle(color: Styles.foregroundColor),
                  textAlign: TextAlign.center,
                ),
                content: Text('May Allah ease your journey',
                    // style: TextStyle(color: Styles.foregroundColor),
                    textAlign: TextAlign.center),
                actions: [
                  Center(
                    child: ElevatedButton(
                        //button at the end of tasbih
                        onPressed: (() {
                                                                                String uid = FirebaseAuth.instance.currentUser!.uid;

                          if (Provider.of<Status>(context, listen: false)
                                      .stat5 !=
                                  5 &&
                              Provider.of<IsNotGreen>(context, listen: false)
                                  .isnotgreen) {
                            context.read<Status>().chg('d5', 3,uid);
                            context.read<IsNotGreen>().chg(true);
                          }
                          _confirmResetAction();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Timer(
                              const Duration(milliseconds: 200),
                              () => showAnimatedDialog<void>(
                                  animationType: DialogTransitionType.fadeScale,
                                  barrierDismissible: false,
                                  duration: const Duration(milliseconds: 350),
                                  context: context,
                                  builder: (_) => const getMedBadgeDialog()));
                        }),
                        child: Text('OK')),
                  )
                ],
              );
            },
          );
        }
        _beadCounter++;
        _accumulatedCounter++;
        if (_beadCounter > _numberOfCountsToCompleteRound) {
          _beadCounter = 0;
          _RoundCounter++;
          if (_canVibrate) Vibration.vibrate(duration: 100, amplitude: 100);
        }
        // else {
        //   if (_canVibrate) Vibrate.feedback(FeedbackType.success);
        // }
      });
    }
    prefs3.setInt(kbcc5, _beadCounter);
    prefs3.setInt(kbrc5, _RoundCounter);
    int nextPage = _controller.page!.round() + 1;
    _controller.animateToPage(nextPage,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}

class _Counter extends StatelessWidget {
  _Counter(
      {Key? key,
      required this.counter,
      this.tsCounter = const TextStyle(
          color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
      required this.counterName,
      this.tsCounterName = const TextStyle(
          color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic)})
      : super(key: key);
  final int counter;
  final TextStyle tsCounter;
  final String counterName;
  final TextStyle tsCounterName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('$counter', style: tsCounter),
        Text('$counterName', style: tsCounterName)
      ],
    );
  }
}
