import 'package:flutter/material.dart';
import 'package:arrows_bloc/ballboard/ball/ball.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Board extends StatelessWidget {
  final numbers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
  ];
  final int size = 10;

  // static const duration = const Duration(seconds: 1);
  // int secondsPassed = 0;
  // bool isActive = false;
  //Timer timer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return
        //Container(
        //height: size.height,
        //color: Colors.blue,
        /// child: Column(
        //  children: <Widget>[
        //   MyTitle(size),

        Grid(numbers, size); //,
    //   Menu(reset, move, secondsPassed, size),
    //  ],
    // ),
    //);
  }
}

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  //Function clickBoard;

  Grid(this.numbers, this.size); //, this.clickBoard);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    return BlocBuilder<BallBloc, BallState>(buildWhen: (prev, state) {
      print('Prev: $prev Next $state');
      print(state.props.toString());
      return prev.runtimeType != state.runtimeType;
    }, builder: (context, state) {
      return Container(
        height: height * 0.60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1.4),
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              /*return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    print(index.toString());
                  })
                : SizedBox.shrink();
          */
              return GridButton("${numbers[index]}", () {
                print(index.toString());
              });
            },
          ),
        ),
      );
    });
  }
}

class GridButton extends StatelessWidget {
  Function click;
  String text;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      //style: ElevatedButton.styleFrom(
      //      fixedSize: const Size(60, 60)), //, primary: Colors.deepOrange),
      // color: Colors.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(8.0),
      // ),
      onPressed: () => (print('Pressed')),
    );
  }
}

class GridButtonBloc extends StatelessWidget {
  final Function click;
  final String text;

  //GridButtonBloc(this.text, this.click);

  const GridButtonBloc(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallBloc, BallState>(buildWhen: (prev, state) {
      print('Prev: $prev Next $state');
      print(state.props.toString());
      return prev.runtimeType != state.runtimeType;
    }, builder: (context, state) {
      return ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        //style: ElevatedButton.styleFrom(
        //      fixedSize: const Size(60, 60)), //, primary: Colors.deepOrange),
        // color: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: new BorderRadius.circular(8.0),
        // ),
        onPressed: () => (print('Pressed')),
      );
    });
  }
}
/*




class ViewBall extends StatelessWidget {
  const ViewBall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallBloc, BallState>(
      buildWhen: (prev, state) {
        print('Prev: $prev Next $state');
        return prev.runtimeType != state.runtimeType;
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ballText(),
            FloatingActionButton(
              child: const Icon(Icons.run_circle),
              onPressed: () =>
                  context.read<BallBloc>().add(const BallStarted(x: 0, y: 0)),
            ),
            FloatingActionButton(
                child: const Icon(Icons.pause_circle),
                onPressed: () {
                  context.read<BallBloc>().add(const BallPaused());
                }),
          ],
        );
      },
    );
  }
}

class ballText extends StatelessWidget {
  const ballText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      context.select((BallBloc bloc) => bloc.state.props.toString()),
      style: Theme.of(context).textTheme.headline5,
    );
  }
}


*/