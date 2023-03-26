import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:flutter/material.dart';

class AdditionalFeatures extends StatefulWidget {
  var emoji;

  var bottomName;

  AdditionalFeatures({
    super.key,
    required this.emoji,
    required this.bottomName,
  });

  @override
  State<AdditionalFeatures> createState() => _AdditionalFeaturesState();
}

class _AdditionalFeaturesState extends State<AdditionalFeatures> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: 75,
        width: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 253, 209, 209),
              blurRadius: 3.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
            )
          ],
        ),
        child: Center(
            child: Column(
          children: [
            Spacer(),
            Text(
              widget.emoji,
              style: TextStyle(color: textColor, fontSize: 28),
            ),
            Spacer(),
            Text(
              widget.bottomName,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 159, 16), fontSize: 15),
            ),
            Spacer()
          ],
        )),
      ),
    );
  }
}
