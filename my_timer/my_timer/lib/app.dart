import 'package:flutter/material.dart';
import 'package:my_timer/timer/timer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const TimerPage(),
    );
  }
}
