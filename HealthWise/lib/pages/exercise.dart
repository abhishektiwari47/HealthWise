import 'package:Healthwise/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../helpers/data.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Exercises'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ExerciseTile(exercise: exercises[index]);
        },
      ),
    );
  }
}

class ExerciseItem {
  String name;
  String details;
  List<String> steps;
  String warning;

  ExerciseItem({
    required this.name,
    required this.details,
    required this.steps,
    required this.warning,
  });
}

class ExerciseTile extends StatelessWidget {
  final ExerciseItem exercise;

  const ExerciseTile({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(exercise.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Details:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(exercise.details),
                SizedBox(height: 10),
                Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
                ...exercise.steps.map((step) => Text("- $step")).toList(),
                SizedBox(height: 10),
                Text("Warning:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text(exercise.warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
