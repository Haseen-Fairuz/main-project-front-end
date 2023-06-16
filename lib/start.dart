import 'package:flutter/material.dart';
import 'package:mainproject/e.dart';
import 'package:mainproject/exc.dart';
import 'package:mainproject/exc1.dart';
import 'package:mainproject/exc2.dart';
import 'package:mainproject/exc3.dart';
import 'package:mainproject/exc4.dart';
import 'package:mainproject/exc5.dart';
import 'package:mainproject/exc6.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 69, 82, 88),
        title: Text(
          "  Full Body Workout",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 206, 211, 206),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            reverse: false,
            padding: const EdgeInsets.all(10),
            children: [
              InkWell(
                child: Container(
                  width: 150,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Push Up x 10",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e1.gif',
                        height: 250,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc()));
                },
              ),
              InkWell(
                child: Container(
                  width: 100,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Abdominal\n  Crunches x 10",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e2.gif',
                        height: 350,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc1()));
                },
              ),
              InkWell(
                child: Container(
                  width: 100,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Russian\n   Twist x 12   ",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e4.gif',
                        height: 250,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc3()));
                },
              ),
              InkWell(
                child: Container(
                  width: 100,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Plank 60 s  ",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e5.gif',
                        height: 250,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc4()));
                },
              ),
              InkWell(
                child: Container(
                  width: 100,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Leg Raises\n    x 16",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e6.gif',
                        height: 250,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc5()));
                },
              ),
              InkWell(
                child: Container(
                  width: 100,
                  height: 105,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 151, 171, 180),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "    Heel Touch\n    x 16",
                        style: TextStyle(
                            fontFamily: 'Acme',
                            fontSize: 30,
                            color: Color.fromARGB(255, 1, 6, 12)),
                      ),
                      Image.asset(
                        'assets/e7.gif',
                        height: 250,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Exc6()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
