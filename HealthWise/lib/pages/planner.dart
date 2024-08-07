import 'package:Healthwise/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../helpers/data.dart';

class Planner extends StatefulWidget {
  const Planner({super.key});

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Diet Planner'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: diets.length,
        itemBuilder: (context, index) {
          return DietTile(diet: diets[index]);
        },
      ),
    );
  }
}

class DietItem {
  String name;
  String details;
  List<String> steps;
  String warning;

  DietItem({
    required this.name,
    required this.details,
    required this.steps,
    required this.warning,
  });
}

class DietTile extends StatelessWidget {
  final DietItem diet;

  const DietTile({Key? key, required this.diet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(diet.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Details:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(diet.details),
                SizedBox(height: 10),
                Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
                ...diet.steps.map((step) => Text("- $step")).toList(),
                SizedBox(height: 10),
                Text("Warning:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                Text(diet.warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
