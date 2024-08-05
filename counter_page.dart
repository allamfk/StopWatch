// counter_page.dart

import 'dart:async';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late Timer _timer;
  int minutes = 10;
  int seconds = 0;
  bool isTimerRunning = false;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isTimerRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _timer.cancel();
        setState(() {
          isTimerRunning = false;
        });
      } else {
        if (seconds == 0) {
          minutes--;
          seconds = 59;
        } else {
          seconds--;
        }
        setState(() {});
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      minutes = 10;
      seconds = 0;
      isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isTimerRunning) {
                  resetTimer();
                } else {
                  startTimer();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                primary: isTimerRunning ? Colors.red : Colors.red,
              ),
              child: Text(
                isTimerRunning ? "Stop" : "Start",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
