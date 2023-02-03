import 'package:flutter/material.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_firebaseauth/game/Day1/physic1/Exercise/startworkout_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'days_list.dart';
import 'exercises_list.dart';

class ExerciseInfo extends StatefulWidget {
  const ExerciseInfo({super.key, required this.id});

  // final String selectedDay = 'Day 1';
  // final String exercises = '7';
  // final String time = '4 mins';
  // final String resttime = '30 secs';
  final String id;

  @override
  State<ExerciseInfo> createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  late List<ExerciseModel> displayedExercises;
  // late List<ExerciseModel> workoutExercises;
  late var dayExercise;
  @override
  void didChangeDependencies() {
    displayedExercises = EXERCISES_LIST.where((element) {
      return element.category.contains(widget.id);
    }).toList();
    dayExercise = DAYS_LIST
        .where((element) {
          return element.id.contains(widget.id);
        })
        .toList()
        .first;
    super.didChangeDependencies();
  }

//   // @override
//   // void initState() {
//   //   // ...
//   //   super.initState();
//   // }

  @override
  Widget build(BuildContext context) {
    // workoutExercises = List.from(displayedExercises);
    var divHeight = MediaQuery.of(context).size.height;
    var divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 254, 161),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: const Color(0xff8AD16A),
            toolbarHeight: divHeight,
            title: Container(
              width: divWidth * .45,
              decoration: BoxDecoration(
                color: const Color(0XffD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      child: Image.asset('images/physic.png',
                          fit: BoxFit.fitHeight)),
                  const Flexible(
                      flex: 3,
                      child: Text(
                        'Physical',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ))
                ],
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   child: const Text(
          //     'Physical Task',
          //     style: TextStyle(fontSize: 60, color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Container(
                // height: 210,
                width: 350,

                decoration: BoxDecoration(
                  //   // gradient: const LinearGradient(colors: [
                  //   //   Color(0xff8E2DE2),
                  //   //   Color(0xff4A00E0),
                  //   // ],
                  //   // begin: Alignment.bottomLeft, end: Alignment.topRight),
                  color: const Color(0xFF1C1F2A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, left: 58, right: 58),
                      child: Text(
                        dayExercise.day,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  dayExercise.exercises,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Exercises',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                                height: 2,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.1,
                                indent: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  dayExercise.time,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Total Time',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Divider(
                                color: Colors.white,
                                thickness: 2,
                                height: 2,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.1,
                                indent: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  dayExercise.restTime,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Rest Time',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: ElevatedButton(
                        //..........................start the workout...........................
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BeginnerStartWorkoutScreen(
                                  workoutExercises: displayedExercises,
                                  day: widget.id,
                                ),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 15,
                          backgroundColor: Colors.transparent,
                          shadowColor: const Color(0xFF242935),
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff434343),
                                Color(0xff000000),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 108, minHeight: 36.0),
                            padding: const EdgeInsets.all(12),
                            // alignment: Alignment.center,
                            child: Text(
                              'START WORKOUT',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    // letterSpacing: 1,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _Physic1State extends State<Physic1> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Center(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Text('Physic1', style: TextStyle(fontSize: 60)),
//           ElevatedButton(
//               onPressed: (() {
//                 if (Provider.of<Status>(context, listen: false).stat != 5 &&
//                     Provider.of<IsNotGreen>(context, listen: false)
//                         .isnotgreen) {
//                   context.read<Status>().chg('d1', 4);
//                   context.read<IsNotGreen>().chg(true);
//                 }
//                 // else
//                 //   print('xmasukpon');
//                 Navigator.pop(context);
//               }),
//               child: Text('OK done'))
//         ])),
//       );
// }
