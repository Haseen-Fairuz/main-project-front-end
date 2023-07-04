import 'package:flutter/material.dart';
import './api.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var seconds;

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
                'assets/e2.gif',
                height: 250,
                width: 350,
              ),
              NeonCircularTimer(
                  // backgroudColor:Colors.green,
                  onComplete: () {
                    seconds = controller.getTimeInSeconds();
                    if (seconds == 10) {
                      //send_request();
                    }

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
                            controller.resume();
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.pause,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            controller.pause();
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.repeat,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            controller.restart();
                          }),
                    ]),
              )
            ],
          ),
        ));
  }
}
