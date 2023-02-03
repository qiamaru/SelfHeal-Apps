import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dialog.dart';
import 'about.dart';

class MazeScreen extends StatefulWidget {
  const MazeScreen({super.key});

  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 200),
        () => showAnimatedDialog<void>(
            animationType: DialogTransitionType.fadeScale,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 350),
            context: context,
            builder: (_) => const AlertTip()));
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
                        child: Image.asset('images/cognitive.png',
                            fit: BoxFit.fitHeight)),
                    const Flexible(
                        flex: 3,
                        child: Text(
                          'Cognitive',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ))
                  ],
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            )),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Timer(
                                const Duration(milliseconds: 200),
                                () => showAnimatedDialog<void>(
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    barrierDismissible: true,
                                    duration: const Duration(milliseconds: 350),
                                    context: context,
                                    builder: (_) => const AlertAbout()));
                          });
                        },
                        tooltip: 'About',
                        icon: Icon(
                          Icons.info,
                          // color: Colors.green,
                          size: 27,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            Timer(
                                const Duration(milliseconds: 200),
                                () => showAnimatedDialog<void>(
                                    animationType:
                                        DialogTransitionType.fadeScale,
                                    barrierDismissible: true,
                                    duration: const Duration(milliseconds: 350),
                                    context: context,
                                    builder: (_) => const AlertTip()));
                          });
                        },
                        tooltip: 'Tips',
                        icon: Icon(
                          Icons.question_mark_rounded,
                          // color: Colors.green,
                          size: 27,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Maze(
                  player: MazeItem('assets/day4-maze/run.png', ImageType.asset),
                  columns: 6,
                  rows: 12,
                  wallThickness: 4.0,
                  wallColor: Theme.of(context).primaryColor,
                  finish: MazeItem(
                      'assets/day4-maze/racing-flag.png', ImageType.asset),
                  onFinish: () {
                    // print('FINISH!!!');
                    setState(() {
                      Timer(
                          const Duration(milliseconds: 200),
                          () => showAnimatedDialog<void>(
                              animationType: DialogTransitionType.fadeScale,
                              barrierDismissible: true,
                              duration: const Duration(milliseconds: 350),
                              context: context,
                              builder: (_) => const dialog()));
                    });
                  }),
            ),
          ],
        )));
  }
}
