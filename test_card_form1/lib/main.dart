import 'package:flutter/material.dart';

import 'card/datamodels/emp_card.dart';

void main() {
  print('1');
  EmpCard mycard = EmpCard(
      id: '1',
      name: 'kf',
      addrees: 'Dmascus',
      salary: 77.44,
      gender: genderEnum.fmale);
  print('2');
  print(mycard);

  //EmpCard mycard2 = EmpCard.fromMap(mycard.toMap());
  print('3');

  EmpCard Mycard3 = EmpCard.fromMap({
    "id": "3",
    "name": "kfqqqq",
    "addrees": "Dmascusqqqq",
    "salary": 66.55,
    "gender": "male"
  });

  print(Mycard3);
  print('4');

  EmpCard Mycard4 = EmpCard.fromJson(Mycard3.toJson());
  //runApp(const MyApp());

  //print(GenderEnumTostring(genderEnum.fmale).value);

  print(Mycard4.toMap());
  print(Mycard4.toJson());

  print(mycard.toString());
  EmpCard Mycard5 =
      Mycard3.copyWith(id: '5', addrees: "damascus", salary: 12399.0);
  print(Mycard5);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
