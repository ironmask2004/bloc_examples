import 'package:flutter/material.dart';
import 'package:arrows_bloc/ballboard/arrows/arrows.dart';
import 'package:arrows_bloc/ballboard/ball/ball.dart';
import 'package:arrows_bloc/core/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArrowsBloc MyarrowsBloc = ArrowsBloc()..add(const ArrowInitialized());

    BallBloc MyBallBloc =
        BallBloc(ticker: TimeTicker(), arrowsBloc: MyarrowsBloc)
          ..add(const BallStarted(x: 1, y: 1));

    print(MyarrowsBloc.runtimeType.hashCode.toString());
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MyarrowsBloc),
          BlocProvider(create: (_) => MyBallBloc)
        ],
        child: MaterialApp(
          title: 'Flutter Ball Bloc',
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(109, 234, 255, 1),
            colorScheme: const ColorScheme.light(
              secondary: Color.fromRGBO(72, 74, 126, 1),
            ),
          ),
          home: const homePage1(),
        ));
  }
}

class homePage1 extends StatelessWidget {
  const homePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Arrows')),
        body: Stack(
          children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(child: ViewBall()),
                ),
                //  Actions(),
                ActionsArrows(),
              ],
            ),
          ],
        ));
  }
}
/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const homePage(),
    );
  }
}*/

/*
class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {homePage
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter Arrows')),
        body: Stack(
          children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(child: BallPage()),
                ),
                //  Actions(),
                ArrowPage(),
              ],
            ),
          ],
        ));
  }
}
*/
class ArrowView1 extends StatelessWidget {
  const ArrowView1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Center(child: Text('TEST')),
            ),
            //  Actions(),
            ActionsArrows(),
          ],
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade500,
          ],
        ),
      ),
    );
  }
}
