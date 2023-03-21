import 'package:Healthwise/helpers/frontEnd.dart';
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
        height: 70, width: 310, decoration: mainWhiteBoxDecoration);
  }
}
