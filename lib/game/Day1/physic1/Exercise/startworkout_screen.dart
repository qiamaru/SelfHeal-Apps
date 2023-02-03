import 'package:flutter/material.dart';

import 'exercises_list.dart';
import 'workout_widget.dart';

class BeginnerStartWorkoutScreen extends StatelessWidget {
  final List<ExerciseModel> workoutExercises;
  final day;

  const BeginnerStartWorkoutScreen(
      {super.key, required this.workoutExercises, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       AppColors.DARK_PURPLE,
      //       AppColors.BRIGHT_PURPLE,
      //     ],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      // ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: BegWorkoutWidget(
            workoutExercises: workoutExercises,
            day: day,
          ),
        ),
      ),
    );
  }
}
