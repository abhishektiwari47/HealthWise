import 'package:flutter/material.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({
    super.key,
  });

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 253, 209, 209),
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
          )
        ],
      ),
    );
  }
}
