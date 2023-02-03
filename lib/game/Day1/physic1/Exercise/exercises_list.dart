class ExerciseModel {
  final String id;
  final List<String> category;
  final String time;
  final String restTime;
  final String nameOfExercise;
  final String sets;
  final String gif;
  final String description;
  final bool timer;

  const ExerciseModel({
    required this.id,
    required this.category,
    required this.time,
    required this.restTime,
    required this.nameOfExercise,
    required this.sets,
    required this.gif,
    required this.description,
    required this.timer,
  });
}

// ignore: constant_identifier_names
const EXERCISES_LIST = [
  //....................
  ExerciseModel(
      id: '1',
      timer: true,
      category: [
        'd1',
        'd2',
        'd3',
        'd7',
      ],
      time: '0',
      restTime: '15',
      nameOfExercise: 'Mountain climber',
      sets: '30',
      gif: 'assets/gifs/mountainclimber.gif',
      description:
          'Get into the push-up position. Bring your right knee towards your chest and keep your left leg straight, then quickly from one leg to another.\n\nMountain climbers are great for building cardio endurance, core strength, and agility. You work several different muscle groups with mountain climbers—it\'s almost like getting a total-body workout with just one exercise.'),

  //....................
  ExerciseModel(
      id: '3',
      timer: true,
      category: [
        'd1',
        'd4',
        'd5',
        'd6',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'High Stepping',
      sets: '30',
      gif: 'assets/gifs/highstepping.gif',
      description:
          'Stand with your feet hip-width apart. Lift up your left knee to your chest.Switch to lift your right knee to your chest.\n\nContinue the movement, alternating legs and moving at a sprinting or running pace.'),

  //....................
  ExerciseModel(
      id: '2',
      timer: false,
      category: [
        'd1',
        'd5',
        'd7',
      ],
      time: '0',
      restTime: '15',
      nameOfExercise: 'Squats',
      sets: 'x 16',
      gif: 'assets/gifs/squats.gif',
      description:
          'Find a foot stance that feels best for you. Pointing your toes slightly outwards helps some, but keeping them parallel is fine, too.\n\nIf you’re not sure what’s best, start by putting your feet shoulder-width apart and pointed about 15 degrees outwards.\n\nWeights are optional'),

  ExerciseModel(
      id: '4',
      timer: false,
      category: [
        'd1',
        'd4',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Push Ups',
      sets: 'x 3',
      gif: 'assets/gifs/pushups.gif',
      description:
          'Get down on all fours, placing your hands slightly wider than your shoulders.\n\nStraighten your arms and legs.\n\nLower your body until your chest nearly touches the floor.Pause, then push yourself back up.\n\nRepeat.'),

  ExerciseModel(
      id: '4',
      timer: false,
      category: [
        'd7',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Push Ups',
      sets: 'x 4',
      gif: 'assets/gifs/pushups.gif',
      description:
          'Get down on all fours, placing your hands slightly wider than your shoulders.\n\nStraighten your arms and legs.\n\nLower your body until your chest nearly touches the floor.Pause, then push yourself back up.\n\nRepeat.'),

  ExerciseModel(
      id: '4',
      timer: false,
      category: [
        'd7',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Push Ups',
      sets: 'x 5',
      gif: 'assets/gifs/pushups.gif',
      description:
          'Get down on all fours, placing your hands slightly wider than your shoulders.\n\nStraighten your arms and legs.\n\nLower your body until your chest nearly touches the floor.Pause, then push yourself back up.\n\nRepeat.'),

  //....................
  ExerciseModel(
      id: '5',
      category: [
        'd1',
        'd4',
        'd6',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Reverse Crunches',
      sets: 'x 16',
      timer: false,
      gif: 'assets/gifs/reversecrunches.gif',
      description:
          'Start lying down with your arms by your sides.\n\nRaise your legs so your thighs are perpendicular to the floor and your knees are bent at a 90° angle.\n\nBreathe out and contract your abs to bring your knees up towards your chest and raise your hips off the floor.'),

  //....................
  ExerciseModel(
      id: '7',
      timer: false,
      category: [
        'd2',
        'd5',
        'd6',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Tricep dips',
      sets: 'x 16',
      gif: 'assets/gifs/tricepdips.gif',
      description:
          'Grip the front edges of a chair or bench with your hand. Hover your butt just off and in front of the seat, feet flat, and legs bent so thighs are parallel to the floor.\n\nStraighten your arms. This is your start position. Lower your body toward the floor until your arms form 90-degree angles. Then, engage your triceps to press back to start. That\'s one rep!'),

  //....................
  ExerciseModel(
      id: '8',
      timer: true,
      category: [
        'd2',
        'd3',
        'd5',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Jumping Jacks',
      sets: '30',
      gif: 'assets/gifs/jumpingjacks.gif',
      description:
          'Stand up straight with your arms at your sides.\n\nJump up while spreading your feet wider than your hips and bring your arms overhead.\n\nJump again to bring your feet back together and lower your arms to your starting position.'),

  //....................
  ExerciseModel(
      id: '9',
      timer: true,
      category: [
        'd2',
        'd6',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Cycling',
      sets: '30',
      gif: 'assets/gifs/cycling.gif',
      description:
          'Lay on your back with your knees bent and pointed upwards. Rest your arms on your side.\n\nNow start cycling in the air with your legs.'),

  //....................
  ExerciseModel(
      id: '10',
      timer: false,
      category: ['d2', 'd5'],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Bicycle Crunches',
      sets: 'x 16',
      gif: 'assets/gifs/bicyclecrunches.gif',
      description:
          'Lie flat on the floor on your lower back. Put your hands behind your head. \n\nRaise your knees and close your right elbow toward your left knee, then close your left elbow toward your right knee. \n\nRepeat the excercise'),

  //....................
  ExerciseModel(
      id: '11',
      timer: false,
      category: ['d3', 'd4', 'd7'],
      time: '30 Secs',
      restTime: '15',
      nameOfExercise: 'Toe touches',
      sets: 'x 16',
      gif: 'assets/gifs/toetouches.gif',
      description:
          'Stand up straight with your legs close to each other.\n\nNow bend over to reach your toes with your hands\n\nDo not bend your knees while touching your toes.'),

  //....................
  ExerciseModel(
      id: '12',
      timer: true,
      category: ['d3'],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Flutter kicks',
      sets: '30',
      gif: 'assets/gifs/flutterkicks.gif',
      description:
          'Lie on your back with your arms resting at your sides. Lift your legs and keep them as straight as you can.\n\nQuickly raise your right leg up and simultaneously lower your left leg.\n\nSwitch legs and repeat'),

  //....................
  ExerciseModel(
      id: '13',
      timer: false,
      category: [
        'd4',
        'd6',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Lunges',
      sets: 'x 16',
      gif: 'assets/gifs/lunges.gif',
      description:
          'Stand with your hands on your hips and your feet shoulder width apart.\n\nTake a step forward with your left leg and lower your body until your left thigh is parallel to the ground.\n\nNow return back to starting position and repeat with other leg.'),

  //....................
  ExerciseModel(
      id: '14',
      timer: false,
      category: ['d7'],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Leg raises',
      sets: 'x 16',
      gif: 'assets/gifs/legraises.gif',
      description:
          'Lie down on your back, and put your hands beneat your hips for support.\n\nLift your legs together up towards the ceiling. Slowly bring down your legs back down and repeat.'),

  //....................
  ExerciseModel(
      id: '20',
      timer: true,
      category: ['d7'],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Plank switches',
      sets: '30',
      gif: 'assets/gifs/plankswitches.gif',
      description:
          'Get to your plank position. Lift your right arm to the side. \n\nNow slowly bring back to starting position and repeat with other arm.'),

  //....................
  ExerciseModel(
      id: '21',
      timer: false,
      category: [
        'd3',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Abdominal Crunches',
      sets: 'x 16',
      gif: 'assets/gifs/abdominalcrunches.gif',
      description:
          'Lie down on your back with your knees bent and your feet flat on the ground. Stretch your arms forward or lock them behind your head.\n\nThen lift your upper body of the floor. Hold for a few seconds and slowly come back.\n\n'),

  //....................
  ExerciseModel(
      id: '6',
      timer: true,
      category: ['d1', 'd2', 'd3', 'd4', 'd5', 'd6'],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Plank',
      sets: '15',
      gif: 'assets/gifs/plank.png',
      description:
          'Lie with your toes and forearms on the ground. \n\nKeep your body straight and hold this position for 15 secs.'),

  ExerciseModel(
      id: '6',
      timer: true,
      category: [
        'd7',
      ],
      time: '1',
      restTime: '15',
      nameOfExercise: 'Plank',
      sets: '20',
      gif: 'assets/gifs/plank.png',
      description:
          'Lie with your toes and forearms on the ground. \n\nKeep your body straight and hold this position for 20 secs.'),

  //....................
  ExerciseModel(
      id: '21',
      timer: true,
      category: [
        'd1',
        'd2',
        'd3',
        'd4',
        'd5',
        'd6',
        'd7',
      ],
      time: '1',
      restTime: '1', //15
      nameOfExercise: 'Cobra Stretch',
      sets: '1', //30
      gif: 'assets/gifs/cobrastretch.gif',
      description:
          'Lie down on your stomach and lock your hands behind your head.\n\nNow slightly lift your chest and lower body simultaneously.\n\nGet back to starting position and repeat'),

  //....................
];
