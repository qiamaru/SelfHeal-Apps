import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'dialog.dart';

class Puzzle2Game extends StatelessWidget {
  // const PuzzleGame({super.key});
  const Puzzle2Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final puzzleKey = GlobalKey<JigsawWidgetState>();
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Color(0xff8AD16A),
            toolbarHeight: divHeight,
            title: Container(
              width: divWidth * .65,
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
                        'Meditate',
                        style: TextStyle(fontSize: 30, color: Colors.black),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await puzzleKey.currentState!.generate();
                      },
                      child: const Text('Play'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        puzzleKey.currentState!.reset();
                      },
                      child: const Text('Clear'),
                    ),
                  ],
                ),
                JigsawPuzzle(
                  gridSize: 2,
                  image: const AssetImage('images/coyg.jpg'),
                  onFinished: () {
                    const dialog();
                    showAnimatedDialog<void>(
                        animationType: DialogTransitionType.fadeScale,
                        barrierDismissible: true,
                        duration: const Duration(milliseconds: 350),
                        context: context,
                        builder: (_) => const dialog());

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
