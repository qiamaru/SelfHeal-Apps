import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:provider/provider.dart';
import 'dialog.dart';
import 'about.dart';
import 'dart:async';
import 'package:test_firebaseauth/provider/hvpressstart.dart';

class PuzzleGame extends StatefulWidget {
  // const PuzzleGame({super.key});
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  @override
  void initState() {
    Timer(
        const Duration(milliseconds: 200),
        () => showAnimatedDialog<void>(
            animationType: DialogTransitionType.fadeScale,
            barrierDismissible: true,
            duration: const Duration(milliseconds: 350),
            context: context,
            builder: (_) => const AlertTip()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final puzzleKey = GlobalKey<JigsawWidgetState>();
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
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        tooltip: 'About',
                        icon: const Icon(Icons.info),
                        color: Colors.green,
                        iconSize: 30,
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
                        }),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await puzzleKey.currentState!.generate();
                        context.read<HvPressStart>().chg(true);
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                      label: Text('Play'),
                    ),
                    // const SizedBox(width: 16),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     puzzleKey.currentState!.reset();
                    //   },
                    //   child: const Text('Clear'),
                    // ),
                    IconButton(
                        tooltip: 'Tip',
                        icon: const Icon(Icons.tips_and_updates),
                        color: Colors.green,
                        iconSize: 30,
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
                        }),
                  ],
                ),
                JigsawPuzzle(
                  gridSize: 2,
                  image: const AssetImage('images/coyg.jpg'),
                  onFinished: () {
                    // const dialog();
                    if (Provider.of<HvPressStart>(context, listen: false)
                        .hvPressStart) {
                      showAnimatedDialog<void>(
                          animationType: DialogTransitionType.fadeScale,
                          barrierDismissible: true,
                          duration: const Duration(milliseconds: 350),
                          context: context,
                          builder: (_) => const dialog());
                      context.read<HvPressStart>().chg(false);
                    }
                    // ignore: avoid_print
                    // print('finished!');
                  },
                  // ignore: avoid_redundant_argument_values
                  snapSensitivity: .5, // Between 0 and 1
                  puzzleKey: puzzleKey,
                  onBlockSuccess: () {
                    print('block success!');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
