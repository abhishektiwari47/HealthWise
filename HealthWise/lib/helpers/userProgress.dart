import 'package:Healthwise/helpers/frontEnd.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  print(d.toString());
  return d.toString().substring(0, 19);
}

class UserProgress extends StatefulWidget {
  UserProgress({
    super.key,
    required this.challangeRank,
  });

  String challangeRank = 'N/A';
  @override
  State<UserProgress> createState() =>
      _UserProgressState(challangeRank: challangeRank);
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
    required this.challangeRank,
  });

  String challangeRank;
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
            boxText: challangeRank,
            boxName: 'Challange Rank',
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
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color: Color.fromARGB(255, 253, 250, 250),
      ),
      height: 75,
      width: 145,
      child: Column(
        children: [
          Spacer(),
          Center(
              child: Text(
            boxText,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 118, 118),
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
                color: Color.fromARGB(255, 179, 174, 174),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
