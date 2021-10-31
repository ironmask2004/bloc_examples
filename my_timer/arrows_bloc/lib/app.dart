import 'package:arrows_bloc/ballboard/board/bloc/worm_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arrows_bloc/ballboard/arrows/arrows.dart';
import 'package:arrows_bloc/ballboard/ball/ball.dart';
import 'package:arrows_bloc/core/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arrows_bloc/ballboard/board/view/board_page.dart';

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArrowsBloc MyarrowsBloc = ArrowsBloc()..add(const ArrowInitialized());

    BallBloc MyBallBloc =
        BallBloc(ticker: TimeTicker(), arrowsBloc: MyarrowsBloc)
          ..add(const BallReset());

    WormBloc MyWormBloc = WormBloc(ballBloc: MyBallBloc)
      ..add(const WormReset());

    // print(MyarrowsBloc.runtimeType.hashCode.toString());
    print('MyWormBloc: ' + MyWormBloc.state.worm.balls.toString());
    MyWormBloc.add(const WormDirChanged("DN"));
    MyWormBloc.add(const WormtailAded());

    print(MyWormBloc.state.worm.balls);

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
              children: <Widget>[
                //Padding(
                // padding: EdgeInsets.symmetric(vertical: 100.0),
                // child: Center(child: ViewBall()),

                // ),

                Board(),
                Row(children: [
                  ViewBall(),
                  ActionsArrows(),
                ])
              ],
            ),
          ],
        ));
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
