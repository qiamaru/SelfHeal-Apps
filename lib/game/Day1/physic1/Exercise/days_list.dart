class DaysWidget {
  final String id;
  final String day;
  final String exercises;
  final String time;
  final String restTime;

  const DaysWidget({
    required this.id,
    required this.day,
    required this.exercises,
    required this.time,
    required this.restTime,
  });
}

const DAYS_LIST = [
  DaysWidget(
    id: 'd1',
    day: 'Day 1',
    exercises: '7',
    time: '4 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd2',
    day: 'Day 2',
    exercises: '7',
    time: '5 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd3',
    day: 'Day 3',
    exercises: '7',
    time: '5 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd4',
    day: 'Day 4',
    exercises: '7',
    time: '4 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd5',
    day: 'Day 5',
    exercises: '7',
    time: '5 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd6',
    day: 'Day 6',
    exercises: '7',
    time: '5 mins',
    restTime: '30 secs',
  ),
  DaysWidget(
    id: 'd7',
    day: 'Day 7',
    exercises: '8',
    time: '5 mins',
    restTime: '30 secs',
  ),
];
