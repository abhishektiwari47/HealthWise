import 'dart:async';

import 'package:Healthwise/helpers/constants.dart';
import 'package:Healthwise/pages/bmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/pages/timer.dart';

class FooterFeatures extends StatefulWidget {
  const FooterFeatures({
    super.key,
  });

  @override
  State<FooterFeatures> createState() => _FooterFeaturesState();
}

class _FooterFeaturesState extends State<FooterFeatures> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          height: 50,
          width: 50,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              // color: Colors.blue,
              // borderRadius: BorderRadius.all(
              //   Radius.circular(30),
              // ),
              ),
          child: Center(
            child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: iconColor,
              child: IconButton(
                  iconSize: 30,
                  splashRadius: 120,
                  splashColor: splashColor,
                  // tooltip: 'Opening Camera',
                  icon: const Icon(
                    Icons.hourglass_bottom,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimerWidget()));
                  }),
            ),
          ),
        ),
        Spacer(),
        Spacer(),
        Container(
          height: 50,
          width: 50,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              // color: Colors.blue,
              // borderRadius: BorderRadius.all(
              //   Radius.circular(30),
              // ),
              ),
          child: Center(
            child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: iconColor,
              child: IconButton(
                  iconSize: 30,
                  splashRadius: 120,
                  splashColor: splashColor,
                  // tooltip: 'Opening Camera',
                  icon: Icon(
                    Icons.calculate,
                    color: whiteColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMICalculator()));
                  }),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}





// Calculating the approximate calories burned per step of a person according to their BMI involves a few steps:

// Calculate the person's basal metabolic rate (BMR). The BMR is the amount of energy (in calories) that a person's body burns at rest to maintain basic bodily functions such as breathing and circulating blood. The most widely used formula to calculate BMR is the Harris-Benedict equation:
// For men: BMR = 88.362 + (13.397 x weight in kg) + (4.799 x height in cm) - (5.677 x age in years)
// For women: BMR = 447.593 + (9.247 x weight in kg) + (3.098 x height in cm) - (4.330 x age in years)

// Multiply the person's BMR by their activity factor to estimate their total daily energy expenditure (TDEE). The activity factor is a number that reflects how active a person is during the day. For example, a sedentary person (e.g. desk job, no exercise) would have an activity factor of 1.2, while a very active person (e.g. construction worker, intense exercise) would have an activity factor of 1.9. The TDEE is an estimate of how many calories a person burns in a day, taking into account their basal metabolic rate and their level of physical activity.
// TDEE = BMR x activity factor

// Calculate the person's average stride length. This can be estimated by dividing the person's height in centimeters by 2.5.
// Stride length = height in cm / 2.5

// Divide the person's TDEE by the number of steps they take in a day to estimate the number of calories burned per step.
// Calories burned per step = TDEE / number of steps

// Note that these calculations are only an estimate and may not be accurate for every individual. Additionally, there are many other factors that can affect how many calories a person burns per step, such as their walking speed, terrain, and other physical characteristics.
