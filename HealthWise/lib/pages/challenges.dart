import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:build_daemon/constants.dart';
import 'dart:convert';

import '../helpers/constants.dart';
import '../helpers/data.dart';


class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {


  @override
  void initState() {
    super.initState();
    _loadChallenges();
  }

  void _loadChallenges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? challengesString = prefs.getString('challenges');
    if (challengesString != null) {
      print("Loaded challenges: $challengesString"); // Debugging print
      List<dynamic> decodedChallenges = jsonDecode(challengesString);
      setState(() {
        challenges = decodedChallenges.map((item) => ChallengeItem.fromJson(item)).toList();
      });
    }
  }

  void _saveChallenges() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedChallenges = jsonEncode(challenges.map((item) => item.toJson()).toList());
    print("Saving challenges: $encodedChallenges"); // Debugging print
    await prefs.setString('challenges', encodedChallenges);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Challenges', style: TextStyle(color: whiteColor)),
        backgroundColor: textColorGreen,
        iconTheme: IconThemeData(color: whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            return Card(
              color: whiteColor,
              shadowColor: whiteBoxGreenShadow,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Text(
                  challenges[index].title,
                  style: TextStyle(
                    color: challenges[index].isCompleted ? textColorGreyFaded : textColorGrey,
                    fontSize: 18,
                  ),
                ),
                trailing: Checkbox(
                  activeColor: iconColor,
                  value: challenges[index].isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      challenges[index].isCompleted = value ?? false;
                      _saveChallenges();
                    });
                  },
                ),
                tileColor: challenges[index].isCompleted ? fadedBgColor : whiteColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChallengeItem {
  String title;
  bool isCompleted;

  ChallengeItem({required this.title, this.isCompleted = false});

  factory ChallengeItem.fromJson(Map<String, dynamic> json) {
    return ChallengeItem(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'isCompleted': isCompleted,
  };
}
