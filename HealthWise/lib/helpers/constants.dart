import 'package:flutter/material.dart';

//Style Variables
const Color bgColor = Color.fromARGB(255, 238, 253, 241);
const Color fadedBgColor = Color.fromARGB(255, 248, 255, 251);
const Color textColorGreen = Color.fromARGB(255, 68, 195, 81);
const Color textColorGrey = Color.fromARGB(255, 80, 80, 80);
const Color textColorYellow = Color.fromARGB(255, 255, 159, 16);
const Color textColorGreyFaded = Color.fromARGB(255, 179, 174, 174);
const Color iconColor = Colors.green;
const Color iconColor2 = Colors.red;
const Color splashColor = Color.fromARGB(255, 223, 255, 224);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color positivePointColor = Color.fromARGB(255, 224, 255, 228);
const Color negetivePointColor = Color.fromARGB(255, 255, 240, 240);
const Color specialTileColor = Color.fromARGB(255, 146, 60, 74);
const Color whiteBoxGreenShadow = Color.fromARGB(255, 209, 253, 215);
const Color circularProgressIndicator = Color.fromARGB(255, 200, 255, 210);

//Shadow Variable
List<BoxShadow> mainShadow = [
  const BoxShadow(
    color: whiteBoxGreenShadow,
    blurRadius: 2.0, // soften the shadow
    spreadRadius: 1.0, //extend the shadow
  )
];

//Decoration
Decoration mainWhiteBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  color: whiteColor,
  boxShadow: mainShadow,
);

Decoration fadedBoxDecoration = const BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(2)),
  color: fadedBgColor,
);
