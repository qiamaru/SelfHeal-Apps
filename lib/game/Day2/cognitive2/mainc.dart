import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

import 'alerts/all.dart';
import 'board_style.dart';
import 'splash_screen_page.dart'; //unused
import 'styles.dart';

class SudokuPage extends StatefulWidget {
  const SudokuPage({Key? key}) : super(key: key);
  static const String versionNumber = '2.4.1';

  @override
  State<StatefulWidget> createState() => SudokuPageState();
}

class SudokuPageState extends State<SudokuPage> {
  bool firstRun = true;
  bool gameOver = false;
  int timesCalled = 0;
  bool isButtonDisabled = false;
  bool isFABDisabled = false;
  late List<List<List<int>>> gameList;
  late List<List<int>> game;
  late List<List<int>> gameCopy;
  late List<List<int>> gameSolved;
  static String? currentDifficultyLevel;
  static String? currentTheme;
  static String? currentAccentColor;
  static String platform = () {
    if (kIsWeb) {
      return 'web-${defaultTargetPlatform.toString().replaceFirst("TargetPlatform.", "").toLowerCase()}';
    } else {
      return defaultTargetPlatform
          .toString()
          .replaceFirst("TargetPlatform.", "")
          .toLowerCase();
    }
  }();
  static bool isDesktop = ['windows', 'linux', 'macos'].contains(platform);

  Future<void> removeSP() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // setState(() {
    //   sharedPrefs.clear();
    // });
  }

  @override
  void initState() {
    removeSP();
    super.initState();
    try {
      doWhenWindowReady(() {
        appWindow.alignment = Alignment.center;
        appWindow.minSize = const Size(625, 625);
      });
      // ignore: empty_catches
    } on UnimplementedError {}
    getPrefs().whenComplete(() {
      if (currentDifficultyLevel == null) {
        currentDifficultyLevel = 'easy';
        setPrefs('currentDifficultyLevel');
      }
      if (currentTheme == null) {
        currentTheme = 'light';
        setPrefs(currentTheme!);
        // if (MediaQuery.maybeOf(context)?.platformBrightness != null) {
        //   currentTheme =
        //       MediaQuery.of(context).platformBrightness == Brightness.light
        //           ? 'light'
        //           : 'dark';
        // }
        // else {
        //   currentTheme = 'dark';
        // }
        // setPrefs('currentTheme');
      }
      if (currentAccentColor == null) {
        currentAccentColor = 'Blue';
        setPrefs('currentAccentColor');
      }
      newGame(currentDifficultyLevel!);
      changeTheme('set');
      changeAccentColor(currentAccentColor!, true);
    });
  }

  Future<void> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentDifficultyLevel = prefs.getString('currentDifficultyLevel');
      currentTheme = prefs.getString('currentTheme');
      currentAccentColor = prefs.getString('currentAccentColor');
    });
  }

  setPrefs(String property) async {
    final prefs = await SharedPreferences.getInstance();
    if (property == 'currentDifficultyLevel') {
      prefs.setString('currentDifficultyLevel', currentDifficultyLevel!);
    } else if (property == 'currentTheme') {
      prefs.setString('currentTheme', currentTheme!);
    } else if (property == 'currentAccentColor') {
      prefs.setString('currentAccentColor', currentAccentColor!);
    }
  }

  void changeTheme(String mode) {
    setState(() {
      if (currentTheme == 'light') {
        if (mode == 'switch') {
          Styles.primaryBackgroundColor = Styles.darkGrey;
          Styles.secondaryBackgroundColor = Styles.grey;
          Styles.foregroundColor = Styles.white;
          currentTheme = 'dark';
        } else if (mode == 'set') {
          Styles.primaryBackgroundColor = Styles.white;
          Styles.secondaryBackgroundColor = Styles.white;
          Styles.foregroundColor = Styles.darkGrey;
        }
      } else if (currentTheme == 'dark') {
        if (mode == 'switch') {
          Styles.primaryBackgroundColor = Styles.white;
          Styles.secondaryBackgroundColor = Styles.white;
          Styles.foregroundColor = Styles.darkGrey;
          currentTheme = 'light';
        } else if (mode == 'set') {
          Styles.primaryBackgroundColor = Styles.darkGrey;
          Styles.secondaryBackgroundColor = Styles.grey;
          Styles.foregroundColor = Styles.white;
        }
      }
      setPrefs('currentTheme');
    });
  }

  void changeAccentColor(String color, [bool firstRun = false]) {
    setState(() {
      if (Styles.accentColors.keys.contains(color)) {
        Styles.primaryColor = Styles.accentColors[color]!;
      } else {
        currentAccentColor = 'Blue';
        Styles.primaryColor = Styles.accentColors[color]!;
      }
      if (color == 'Red') {
        Styles.secondaryColor = Styles.orange;
      } else {
        Styles.secondaryColor = Styles.lightRed;
      }
      if (!firstRun) {
        setPrefs('currentAccentColor');
      }
    });
  }

  void checkResult() {
    try {
      if (SudokuUtilities.isSolved(game)) {
        isButtonDisabled = !isButtonDisabled;
        gameOver = true;
        Timer(const Duration(milliseconds: 500), () {
          showAnimatedDialog<void>(
              animationType: DialogTransitionType.fadeScale,
              barrierDismissible: true,
              duration: const Duration(milliseconds: 350),
              context: context,
              builder: (_) => const AlertGameOver()).whenComplete(() {
            if (AlertGameOver.newGame) {
              newGame();
              AlertGameOver.newGame = false;
            } else if (AlertGameOver.restartGame) {
              restartGame();
              AlertGameOver.restartGame = false;
            }
          });
        });
      }
    } on InvalidSudokuConfigurationException {
      return;
    }
  }

  static Future<List<List<List<int>>>> getNewGame(
      [String difficulty = 'easy']) async {
    int emptySquares;
    switch (difficulty) {
      case 'test':
        {
          emptySquares = 2;
        }
        break;
      case 'beginner':
        {
          emptySquares = 18;
        }
        break;
      case 'easy':
        {
          emptySquares = 27;
        }
        break;
      case 'medium':
        {
          emptySquares = 36;
        }
        break;
      case 'hard':
        {
          emptySquares = 54;
        }
        break;
      default:
        {
          emptySquares = 2;
        }
        break;
    }
    SudokuGenerator generator = SudokuGenerator(emptySquares: emptySquares);
    return [generator.newSudoku, generator.newSudokuSolved];
  }

  static List<List<int>> copyGrid(List<List<int>> grid) {
    return grid.map((row) => [...row]).toList();
  }

  void setGame(int mode, [String difficulty = 'easy']) async {
    if (mode == 1) {
      game = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
      gameCopy = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
      gameSolved = List.filled(9, [0, 0, 0, 0, 0, 0, 0, 0, 0]);
    } else {
      gameList = await getNewGame(difficulty);
      game = gameList[0];
      gameCopy = copyGrid(game);
      gameSolved = gameList[1];
    }
  }

  void showSolution() {
    setState(() {
      game = copyGrid(gameSolved);
      isButtonDisabled =
          !isButtonDisabled ? !isButtonDisabled : isButtonDisabled;
      gameOver = true;
    });
  }

  void newGame([String difficulty = 'easy']) {
    setState(() {
      isFABDisabled = !isFABDisabled;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        setGame(2, difficulty);
        isButtonDisabled =
            isButtonDisabled ? !isButtonDisabled : isButtonDisabled;
        gameOver = false;
        isFABDisabled = !isFABDisabled;
      });
    });
  }

  void restartGame() {
    setState(() {
      game = copyGrid(gameCopy);
      isButtonDisabled =
          isButtonDisabled ? !isButtonDisabled : isButtonDisabled;
      gameOver = false;
    });
  }

  List<SizedBox> createButtons() {
    if (firstRun) {
      setGame(1);
      firstRun = false;
    }

    List<SizedBox> buttonList = List<SizedBox>.filled(9, const SizedBox());
    for (var i = 0; i <= 8; i++) {
      var k = timesCalled;
      buttonList[i] = SizedBox(
        key: Key('grid-button-$k-$i'),
        width: buttonSize(),
        height: buttonSize(),
        child: TextButton(
          onPressed: isButtonDisabled || gameCopy[k][i] != 0
              ? null
              : () {
                  showAnimatedDialog<void>(
                          animationType: DialogTransitionType.fade,
                          barrierDismissible: true,
                          duration: const Duration(milliseconds: 300),
                          context: context,
                          builder: (_) => const AlertNumbersState())
                      .whenComplete(() {
                    callback([k, i], AlertNumbersState.number);
                    AlertNumbersState.number = null;
                  });
                },
          onLongPress: isButtonDisabled || gameCopy[k][i] != 0
              ? null
              : () => callback([k, i], 0),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(buttonColor(k, i)),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return gameCopy[k][i] == 0
                    ? emptyColor(gameOver)
                    : Styles.foregroundColor;
              }
              return game[k][i] == 0
                  ? buttonColor(k, i)
                  : Styles.secondaryColor;
            }),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: buttonEdgeRadius(k, i),
            )),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
              color: Styles.foregroundColor,
              width: 1,
              style: BorderStyle.solid,
            )),
          ),
          child: Text(
            game[k][i] != 0 ? game[k][i].toString() : ' ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: buttonFontSize()),
          ),
        ),
      );
    }
    timesCalled++;
    if (timesCalled == 9) {
      timesCalled = 0;
    }
    return buttonList;
  }

  Row oneRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createButtons(),
    );
  }

  List<Row> createRows() {
    List<Row> rowList = List<Row>.generate(9, (i) => oneRow());
    return rowList;
  }

  void callback(List<int> index, int? number) {
    setState(() {
      if (number == null) {
        return;
      } else if (number == 0) {
        game[index[0]][index[1]] = number;
      } else {
        game[index[0]][index[1]] = number;
        checkResult();
      }
    });
  }

  showOptionModalSheet(BuildContext context) {
    BuildContext outerContext = context;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Styles.secondaryBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        builder: (context) {
          final TextStyle customStyle =
              TextStyle(inherit: false, color: Styles.foregroundColor);
          return Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.refresh, color: Styles.foregroundColor),
                title: Text('Restart Game', style: customStyle),
                onTap: () {
                  Navigator.pop(context);
                  Timer(const Duration(milliseconds: 200), () => restartGame());
                },
              ),
              ListTile(
                leading: Icon(Icons.add_rounded, color: Styles.foregroundColor),
                title: Text('New Game', style: customStyle),
                onTap: () {
                  Navigator.pop(context);
                  Timer(const Duration(milliseconds: 200),
                      () => newGame(currentDifficultyLevel!));
                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb_outline_rounded,
                    color: Styles.foregroundColor),
                title: Text('Show Solution (Beta)', style: customStyle),
                onTap: () {
                  Navigator.pop(context);
                  Timer(
                      const Duration(milliseconds: 200), () => showSolution());
                  showAnimatedDialog(
                      context: context, builder: (_) => const AlertGameOver());
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.build_outlined, color: Styles.foregroundColor),
                title: Text('Set Difficulty', style: customStyle),
                onTap: () {
                  Navigator.pop(context);
                  Timer(
                      const Duration(milliseconds: 300),
                      () => showAnimatedDialog<void>(
                              animationType: DialogTransitionType.fadeScale,
                              barrierDismissible: true,
                              duration: const Duration(milliseconds: 350),
                              context: outerContext,
                              builder: (_) => AlertDifficultyState(
                                  currentDifficultyLevel!)).whenComplete(() {
                            if (AlertDifficultyState.difficulty != null) {
                              Timer(const Duration(milliseconds: 300), () {
                                newGame(
                                    AlertDifficultyState.difficulty ?? 'test');
                                currentDifficultyLevel =
                                    AlertDifficultyState.difficulty;
                                AlertDifficultyState.difficulty = null;
                                setPrefs('currentDifficultyLevel');
                              });
                            }
                          }));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.invert_colors_on_rounded,
              //       color: Styles.foregroundColor),
              //   title: Text('Switch Theme', style: customStyle),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Timer(const Duration(milliseconds: 200), () {
              //       changeTheme('switch');
              //     });
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.color_lens_outlined,
              //       color: Styles.foregroundColor),
              //   title: Text('Change Accent Color', style: customStyle),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Timer(
              //         const Duration(milliseconds: 200),
              //         () => showAnimatedDialog<void>(
              //                 animationType: DialogTransitionType.fadeScale,
              //                 barrierDismissible: true,
              //                 duration: const Duration(milliseconds: 350),
              //                 context: outerContext,
              //                 builder: (_) => AlertAccentColorsState(
              //                     currentAccentColor!)).whenComplete(() {
              //               if (AlertAccentColorsState.accentColor != null) {
              //                 Timer(const Duration(milliseconds: 300), () {
              //                   currentAccentColor =
              //                       AlertAccentColorsState.accentColor;
              //                   changeAccentColor(
              //                       currentAccentColor.toString());
              //                   AlertAccentColorsState.accentColor = null;
              //                   setPrefs('currentAccentColor');
              //                 });
              //               }
              //             }));
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.info_outline_rounded,
              //       color: Styles.foregroundColor),
              //   title: Text('About', style: customStyle),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Timer(
              //         const Duration(milliseconds: 200),
              //         () => showAnimatedDialog<void>(
              //             animationType: DialogTransitionType.fadeScale,
              //             barrierDismissible: true,
              //             duration: const Duration(milliseconds: 350),
              //             context: outerContext,
              //             builder: (_) => const AlertAbout()));
              //   },
              // ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        //scaffold wrapped w willpop bfore this
        backgroundColor: Styles.primaryBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: isDesktop
                ? MoveWindow(
                    onDoubleTap: () => appWindow.maximizeOrRestore(),
                    child: AppBar(
                      // centerTitle: true,
                      // title: const Text('Sudoku'),
                      //  backgroundColor: Styles.primaryColor,
                      backgroundColor: Color(0xff8AD16A),
                      toolbarHeight: divHeight / 2,
                      title: Container(
                          // decoration:
                          //     BoxDecoration(border: Border.all(color: Colors.black)),
                          // height: 120,
                          width: divWidth * .6,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Image.asset('images/logoappBar.png',
                              fit: BoxFit.fitHeight)),
                      centerTitle: true,
                      automaticallyImplyLeading: false,

                      actions: [
                        IconButton(
                          icon: const Icon(Icons.minimize_outlined),
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                          onPressed: () {
                            appWindow.minimize();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded),
                          padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                          onPressed: () {
                            showAnimatedDialog<void>(
                                animationType: DialogTransitionType.fadeScale,
                                barrierDismissible: true,
                                duration: const Duration(milliseconds: 350),
                                context: context,
                                builder: (_) => const AlertExit());
                          },
                        ),
                      ],
                    ),
                  )
                : AppBar(
                    // centerTitle: true,
                    // title: const Text('Sudoku'),
                    backgroundColor: Color(0xff8AD16A),
                    toolbarHeight: divHeight,
                    title: Container(
                      // padding: EdgeInsets.all(10),
                      // alignment: Alignment.center,
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
                              // fit: FlexFit.loose,
                              child: Image.asset('images/cognitive.png',
                                  fit: BoxFit.fitHeight)),
                          Flexible(
                              flex: 3,
                              // fit: FlexFit.loose,
                              child: Text(
                                'Cognitive',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ))
                        ],
                      ),
                    ),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                  )),
        body: Builder(builder: (builder) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28),
                child: const Text(
                  'The goal of Sudoku is to fill a 9×9 grid with numbers so that each row, column'
                  ' and 3×3 section contain all of the digits between 1~9. Try it out and'
                  ' give it your best shot!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: divHeight / 3 * .2,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: createRows(),
              ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Styles.primaryBackgroundColor,
          backgroundColor:
              isFABDisabled ? Color(0xff8AD16A) : Color(0xff8AD16A),
          onPressed: isFABDisabled ? null : () => showOptionModalSheet(context),
          child: const Icon(Icons.menu_rounded),
        ));
  }
}
