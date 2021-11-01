import 'package:arrows_bloc/ballboard/board/model/worm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:arrows_bloc/ballboard/board/bloc/worm_bloc.dart';

class BoardView extends StatelessWidget {
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

        Grid(size); //,
    //   Menu(reset, move, secondsPassed, size),
    //  ],
    // ),
    //);
  }
}

class Grid extends StatelessWidget {
  var size;
  //Function clickBoard;

  Grid(this.size); //, this.clickBoard);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    return BlocBuilder<WormBloc, WormState>(

        /*buildWhen: (prev, state) {
      print(
          'Prev: ' + prev.props.toString() + ' Next ' + state.props.toString());
      print(
          "=========bloc listen ===================" + state.props.toString());
      return (state is WormRunInProgress &&
          prev.props.toString() != state.props.toString);
    },*/
        builder: (context, state) {
      List<Point> allBalls = List.from(state.worm.balls)
        ..addAll(state.worm.redGreenBalls);

      return Container(
          height: height * 0.60,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1.4),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    //  print('tttt');

                    int cy, cx;

                    cx = index % 10;
                    cy = index ~/ 10;
                    Point cp = // state.worm.balls.
                        allBalls.firstWhere((a) => a.x == cx && a.y == cy,
                            orElse: () => Point(cx, cy, "-", 0));
                    if (cp.direction != "-") {
                      print('Found Grid Point :' + cp.toString());
                    }

                    return ((cp.direction != "-")
                        ? CurrebBallButton(index, cp.direction, cp.index)
                        : GridButton("", () {
                            print(index.toString());
                          }));
                  })));
    });
  }

  FloatingActionButton CurrebBallButton(
      int index, String _direction, _ballindex) {
    var _icon = Icons.add;
    var _color = Colors.yellow;
    var _text;
    print('Diection IIIIIIIIIIIIII $_direction');
    switch (_direction) {
      case ('UP'):
        _icon = Icons.arrow_upward;
        _color = Colors.yellow;
        break;
      case ('DN'):
        _icon = Icons.arrow_downward;
        _color = Colors.yellow;
        break;
      case ('LF'):
        _icon = Icons.arrow_back;
        _color = Colors.yellow;
        break;
      case ('RT'):
        _icon = Icons.arrow_forward;
        _color = Colors.yellow;
        break;
      case ('+'):
        _icon = Icons.face;
        _color = Colors.yellow;
        break;
      case ('G'):
        _icon = Icons.plus_one;
        _color = Colors.green;

        break;
      case ('R'):
        _color = Colors.red;

        _icon = Icons.warning_amber;
        break;
    }
    _text = (_direction == 'R' || _direction == 'G') ? '' : '$_ballindex';
    return FloatingActionButton.extended(
        icon: Icon(_icon),
        label: Text(_text),
        backgroundColor: _color,
        onPressed: () {
          print(index.toString());
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
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),

      //style: ElevatedButton.styleFrom(
      //      fixedSize: const Size(60, 60)), //, primary: Colors.deepOrange),
      // color: Colors.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: new BorderRadius.circular(8.0),
      // ),
      onPressed: () => (click()),
    );
  }
}
