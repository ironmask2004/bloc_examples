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
    return BlocBuilder<WormBloc, WormState>(buildWhen: (prev, state) {
      print(
          'Prev: ' + prev.props.toString() + ' Next ' + state.props.toString());
      print(
          "=========bloc listen ===================" + state.props.toString());
      return (state is WormRunInProgress &&
          prev.props.toString() != state.props.toString);
    }, builder: (context, state) {
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
                    print('tttt');

                    int cy, cx;

                    cx = index % 10;
                    cy = index ~/ 10;
                    Point cp = state.worm.balls.firstWhere(
                        (a) => a.x == cx && a.y == cy,
                        orElse: () => Point(cx, cy, "-"));
                    if (cp.direction != "-") {
                      print('Found Grid Point :' + cp.toString());
                    }

                    return ((cp.direction != "-")
                        ? CurrebBallButton(index, cp.direction)
                        : GridButton("", () {
                            print(index.toString());
                          }));
                  })));
    });
  }

  FloatingActionButton CurrebBallButton(int index, String _direction) {
    var _icon = Icons.add;
    print('Diection IIIIIIIIIIIIII $_direction');
    switch (_direction) {
      case ('UP'):
        _icon = Icons.arrow_upward;
        break;
      case ('DN'):
        _icon = Icons.arrow_downward;
        break;
      case ('LF'):
        _icon = Icons.arrow_left;
        break;
      case ('RT'):
        _icon = Icons.arrow_right;
        break;
      case ('+'):
        _icon = Icons.plus_one;
        break;
    }
    return FloatingActionButton(
        child: Icon(_icon),
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
