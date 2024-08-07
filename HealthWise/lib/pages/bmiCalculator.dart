import 'package:flutter/material.dart';

import '../helpers/constants.dart';

// Color scheme constants


class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  // Variables to store height and weight input
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  // Function to calculate BMI
  double calculateBMI(double height, double weight) {
    if (height <= 0 || weight <= 0) return 0;

    // BMI formula: weight (kg) / [height (m)]^2
    double heightInMeters = height / 100; // Convert height from cm to meters
    return weight / (heightInMeters * heightInMeters);
  }

  // Function to interpret BMI range
  String interpretBMI(double bmi) {
    if (bmi <= 0) return "Invalid";
    else if (bmi < 18.5) return "Underweight";
    else if (bmi < 24.9) return "Normal";
    else if (bmi < 29.9) return "Overweight";
    else return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: textColorGreen, // Set app bar color
      ),
      backgroundColor: bgColor, // Set background color
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            // Height input field
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                fillColor: whiteColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Weight input field
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                fillColor: whiteColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Calculate button
            ElevatedButton(
              onPressed: () {
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;
                double bmi = calculateBMI(height, weight);
                String bmiCategory = interpretBMI(bmi);

                // Show BMI result in a dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('BMI Result'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Your BMI: ${bmi.toStringAsFixed(1)}'),
                          SizedBox(height: 8.0),
                          Text('Category: $bmiCategory'),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                primary: textColorGreen, // Set button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
