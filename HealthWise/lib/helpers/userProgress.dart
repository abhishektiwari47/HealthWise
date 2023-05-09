import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  print(d.toString());
  return d.toString().substring(0, 19);
}

//this is not pushed
class UserProgress extends StatefulWidget {
  UserProgress({
    super.key,
    required this.exerciseStreak,
  });

  String exerciseStreak = '0';
  @override
  State<UserProgress> createState() =>
      _UserProgressState(exerciseStreak: exerciseStreak);
}

class _UserProgressState extends State<UserProgress> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _steps = '---';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  // void onPedestrianStatusChanged(PedestrianStatus event) {
  //   print(event);
  //   setState(() {
  //     _status = event.status;
  //   });
  // }

  // void onPedestrianStatusError(error) {
  //   print('onPedestrianStatusError: $error');
  //   setState(() {
  //     _status = 'Pedestrian Status not available';
  //   });
  //   print(_status);
  // }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    // _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    // _pedestrianStatusStream
    //     .listen(onPedestrianStatusChanged)
    //     .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  _UserProgressState({
    required this.exerciseStreak,
  });

  String exerciseStreak;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      height: 85,
      width: 310,
      decoration: mainWhiteBoxDecoration,
      child: Row(
        children: [
          UserProgressDataBox(
            boxText: _steps,
            boxName: 'Steps Count',
          ),
          Spacer(),
          UserProgressDataBox(
            boxText: exerciseStreak,
            boxName: 'Exercise Streak',
          ),
        ],
      ),
    );
  }
}

class UserProgressDataBox extends StatelessWidget {
  UserProgressDataBox({
    super.key,
    required this.boxName,
    required this.boxText,
  });
  String boxText;
  String boxName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: fadedBoxDecoration,
      height: 75,
      width: 145,
      child: Column(
        children: [
          Spacer(),
          Center(
              child: Text(
            boxText,
            style: const TextStyle(
              color: textColorGreen,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
            ),
          )),
          Spacer(),
          Center(
            child: Text(
              boxName,
              style: TextStyle(
                color: textColorGreyFaded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
