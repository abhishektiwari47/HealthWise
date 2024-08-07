import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 30), _onTimerTick);
  }

  void _onTimerTick(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {});
    }
  }

  void _startTimer() {
    _stopwatch.start();
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    _stopwatch.stop();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _stopwatch.reset();
    setState(() {});
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitMilliseconds =
        twoDigits(duration.inMilliseconds.remainder(1000) ~/ 10);

    return "$twoDigitMinutes:$twoDigitSeconds:$twoDigitMilliseconds";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Timer'),
        backgroundColor: Colors.green, // Customize app bar color
      ),
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_stopwatch.elapsed),
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  child: Text(_isRunning ? 'Pause' : 'Start'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset',),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


