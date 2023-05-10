import 'package:Healthwise/helpers/constants.dart';
import 'package:Healthwise/helpers/frontEnd.dart';
import 'package:Healthwise/pages/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AdditionalFeatures extends StatefulWidget {
  var emoji;
  var navigation;
  var bottomName;

  AdditionalFeatures({
    super.key,
    required this.emoji,
    required this.bottomName,
    required this.navigation,
  });

  @override
  State<AdditionalFeatures> createState() => _AdditionalFeaturesState();
}

class _AdditionalFeaturesState extends State<AdditionalFeatures> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.navigation))
      },
      child: Container(
        height: 75,
        width: 85,
        decoration: mainWhiteBoxDecoration,
        child: Center(
            child: Column(
          children: [
            Spacer(),
            Text(
              widget.emoji,
              style: TextStyle(color: textColorGreen, fontSize: 28),
            ),
            Spacer(),
            Text(
              widget.bottomName,
              textAlign: TextAlign.left,
              style: TextStyle(color: textColorYellow, fontSize: 15),
            ),
            Spacer()
          ],
        )),
      ),
    );
  }
}
