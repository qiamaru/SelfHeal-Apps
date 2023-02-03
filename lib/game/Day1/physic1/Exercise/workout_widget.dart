import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:test_firebaseauth/provider/isnotgreen_provider.dart';
import 'package:test_firebaseauth/provider/status_provider.dart';
import '../Exercise/exercises_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:test_firebaseauth/badgeDialog/badgePhyDialog.dart';
import 'dart:async';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';

class BegWorkoutWidget extends StatefulWidget {
  final List<ExerciseModel> workoutExercises;
  final day;

  const BegWorkoutWidget(
      {super.key, required this.workoutExercises, required this.day});

  @override
  _BegWorkoutWidgetState createState() => _BegWorkoutWidgetState();
}

class _BegWorkoutWidgetState extends State<BegWorkoutWidget> {
  bool isCircle = false;
  bool timerdone = true;
  bool exercisedone = false;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final CountDownController yourController = CountDownController();

    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: widget.workoutExercises.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blueGrey[900],
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       AppColors.DARK_PURPLE,
          //       AppColors.BRIGHT_PURPLE,
          //       AppColors.LIGHT_BLACK,
          //       AppColors.BLACK,
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(17),
                height: 280,
                width: double.infinity,
                child: Card(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image(
                    image: AssetImage(widget.workoutExercises[index].gif),
                  ), //...........................
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: 30),
                  Text(
                    widget.workoutExercises[index].nameOfExercise,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  // SizedBox(width: size.size.width * 0.00001),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.info,
                  //     size: 25,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () {
                  //     showModalBottomSheet<dynamic>(
                  //       isScrollControlled: true,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30.0),
                  //       ),
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return BegModalSheet(
                  //           gif: widget.workoutExercises[index].gif,
                  //           sets: widget.workoutExercises[index].sets,
                  //           nameOfExercise:
                  //               widget.workoutExercises[index].nameOfExercise,
                  //           description:
                  //               widget.workoutExercises[index].description,
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // // widget.workoutExercises[index].timer == false
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             widget.workoutExercises[index].sets,
              //             style: GoogleFonts.montserrat(
              //               textStyle: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 65,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ],
              //       )
              //     :
              //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //         NeonCircularTimer(
              //           width: 150,
              //           duration:
              //               int.parse(widget.workoutExercises[index].sets),
              //           controller: your_controller,
              //           isTimerTextShown: true,
              //           isReverse: true,
              //           neumorphicEffect: true,
              //           innerFillGradient: LinearGradient(colors: [
              //             Colors.greenAccent.shade200,
              //             Colors.blueAccent.shade400
              //           ]),
              //           neonGradient: LinearGradient(colors: [
              //             Colors.greenAccent.shade200,
              //             Colors.blueAccent.shade400
              //           ]),
              //         ),
              //       ]),
              const SizedBox(
                height: 20,
              ),
              if (index == 0)
                ArgonTimerButton(
                  initialTimer: 10, // Optional
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  // * 0.85,
                  minWidth: MediaQuery.of(context).size.width,
                  // * 0.85,
                  color: Colors.white,
                  borderRadius: 5.0,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastLinearToSlowEaseIn,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.workoutExercises[index].timer == true) ...[
                          NeonCircularTimer(
                            width: 150,
                            duration:
                                int.parse(widget.workoutExercises[index].sets) +
                                    1,
                            controller: yourController,
                            onStart: () => timerdone = false,
                            onComplete: () => timerdone = true,
                            isTimerTextShown: true,
                            isReverse: true,
                            neumorphicEffect: true,
                            innerFillGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                            neonGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ] else ...{
                          Text(
                            widget.workoutExercises[index].sets,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 65,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        },
                        const Text(
                          "Click When Done",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        )
                      ]),

                  loader: (timeLeft) {
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Start in \n$timeLeft",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                  onTap: (startTimer, btnState) {
                    if (btnState == ButtonState.Idle && timerdone == true) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.linearToEaseOut);
                    }
                  },
                ),

              if (index == widget.workoutExercises.length - 1)
                ArgonTimerButton(
                  initialTimer: 3, //30 // Optional
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  // * 0.55,
                  minWidth: MediaQuery.of(context).size.width,
                  // * 0.40,
                  color: Colors.white,
                  borderRadius: 5.0,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastLinearToSlowEaseIn,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.workoutExercises[index].timer == true) ...[
                          Visibility(
                            visible: !exercisedone,
                            child: NeonCircularTimer(
                              width: 150,
                              duration: int.parse(
                                      widget.workoutExercises[index].sets) +
                                  1,
                              controller: yourController,
                              onStart: () => timerdone = false,
                              onComplete: () => setState(() {
                                exercisedone = true;
                                timerdone = true;
                              }),
                              isTimerTextShown: true,
                              isReverse: true,
                              neumorphicEffect: true,
                              innerFillGradient: LinearGradient(colors: [
                                Colors.greenAccent.shade200,
                                Colors.blueAccent.shade400
                              ]),
                              neonGradient: LinearGradient(colors: [
                                Colors.greenAccent.shade200,
                                Colors.blueAccent.shade400
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ] else ...{
                          Visibility(
                            visible: !exercisedone,
                            child: Text(
                              widget.workoutExercises[index].sets,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        },
                        Visibility(
                          visible: exercisedone,
                          child: const Text(
                            "WELL DONE!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ]),
                  loader: (timeLeft) {
                    return Text(
                      "Rest Time \n$timeLeft",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    );
                  },
                  onTap: (startTimer, btnState) {
                    if (btnState == ButtonState.Idle && timerdone == true) {
                      // controller.nextPage(
                      //     duration: Duration(milliseconds: 1000),
                      //     curve: Curves.linearToEaseOut);
                    }
                  },
                ),
              if (index != 0 && index != widget.workoutExercises.length - 1)
                ArgonTimerButton(
                  initialTimer: 30, // Optional
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  // * 0.55,
                  minWidth: MediaQuery.of(context).size.width,
                  // * 0.40,
                  color: Colors.white,
                  borderRadius: 5.0,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastLinearToSlowEaseIn,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.workoutExercises[index].timer == true) ...[
                          NeonCircularTimer(
                            width: 150,
                            duration:
                                int.parse(widget.workoutExercises[index].sets) +
                                    1,
                            controller: yourController,
                            onStart: () => timerdone = false,
                            onComplete: () => timerdone = true,
                            isTimerTextShown: true,
                            isReverse: true,
                            neumorphicEffect: true,
                            innerFillGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                            neonGradient: LinearGradient(colors: [
                              Colors.greenAccent.shade200,
                              Colors.blueAccent.shade400
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ] else ...{
                          Text(
                            widget.workoutExercises[index].sets,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 65,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        },
                        const Text(
                          "Click When Done",
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                  loader: (timeLeft) {
                    return Text(
                      "Rest Time \n$timeLeft",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    );
                  },
                  ////////////////////////////////////////////////////////////////////////
                  onTap: (startTimer, btnState) {
                    if (btnState == ButtonState.Idle && timerdone == true) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.linearToEaseOut);
                    }
                  },
                ),
              // SizedBox(
              //   height: 10,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  index == widget.workoutExercises.length - 1
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Visibility(
                            visible: exercisedone,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                switch (widget.day) {
                                  case 'd1':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d1', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd2':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat2 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d2', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd3':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat3 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d3', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd9':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat4 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d4', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd5':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat5 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d5', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd6':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat6 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d6', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                  case 'd7':
                                    {
                                      String uid = FirebaseAuth
                                          .instance.currentUser!.uid;

                                      if (Provider.of<Status>(context,
                                                      listen: false)
                                                  .stat7 !=
                                              5 &&
                                          Provider.of<IsNotGreen>(context,
                                                  listen: false)
                                              .isnotgreen) {
                                        context
                                            .read<Status>()
                                            .chg('d7', 4, uid);
                                        context.read<IsNotGreen>().chg(true);
                                        print(widget.workoutExercises[0].id);
                                      }
                                    }
                                    break;
                                }

                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Timer(
                                    const Duration(milliseconds: 200),
                                    () => showAnimatedDialog<void>(
                                        animationType:
                                            DialogTransitionType.fadeScale,
                                        barrierDismissible: false,
                                        duration:
                                            const Duration(milliseconds: 350),
                                        context: context,
                                        builder: (_) =>
                                            const getPhyBadgeDialog()));

                                isCircle = true;
                              },
                              child: Text(
                                'Exit',
                                style: GoogleFonts.blinker(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: TextButton(
                            onPressed: () {
                              timerdone = true;
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.linearToEaseOut);
                            },
                            child: Text(
                              'Skip',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
