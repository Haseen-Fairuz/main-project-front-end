import 'dart:async';

import 'package:flutter/material.dart';
import './api.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var seconds;
  late DateTime _startTime;
  late Timer _timer;

  void _startTimer() {
    _startTime = DateTime.now();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Calculate the time elapsed since the start time
      Duration elapsed = DateTime.now().difference(_startTime);

      if (elapsed.inSeconds % 10 == 0) {
        print('Sending request...');
        //getData();
      }

      setState(() {
        var _remainingTime = 30 - elapsed.inSeconds;
      });

      // Check if the timer has expired
      if (elapsed.inSeconds >= 30) {
        // Stop the timer
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final CountDownController controller = new CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 12, 7, 45),
        appBar: AppBar(
          title: Text('Abdominal Crunches'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/e3.gif',
                height: 250,
                width: 350,
              ),
              NeonCircularTimer(
                  // backgroudColor:Colors.green,
                  onComplete: () {
                    controller.restart();
                  },
                  textStyle: TextStyle(
                      fontSize: 40.0,
                      color: Color.fromARGB(139, 255, 255, 255)),
                  width: 200,
                  controller: controller,
                  duration: 60,
                  strokeWidth: 10,
                  isTimerTextShown: true,
                  neumorphicEffect: true,
                  // outerStrokeColor: Colors.grey.shade100,
                  outerStrokeColor: Colors.black12,
                  innerFillGradient: LinearGradient(colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                  neonGradient: LinearGradient(colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                  strokeCap: StrokeCap.round,
                  innerFillColor: Colors.black12,
                  // innerFillColor: Colors.amber,
                  // backgroudColor: Colors.grey.shade100,
                  backgroudColor: Color.fromARGB(255, 3, 10, 49),
                  neonColor: Colors.blue.shade900),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            // _resumeTimer(DateTime.now());
                            // dispose();
                            _startTimer();
                            controller.resume();
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.pause,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            // dispose();
                            controller.pause();
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.repeat,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            _startTimer();
                            controller.restart();
                          }),
                    ]),
              )
            ],
          ),
        ));
  }
}
