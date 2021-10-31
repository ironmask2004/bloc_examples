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
      print(
          'Prev: ' + prev.props.toString() + ' Next ' + state.props.toString());
      print(state.props.toString());
      return (state is BallRunInProgress &&
          prev.props.toString() != state.props.toString);
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
                  var _curentBall = (int.tryParse(state.props[0].toString())! +
                      int.tryParse(state.props[1].toString())! * 10);
                  return ((index == _curentBall)
                      ?

                      //GridButton(state.props[2].toString(), () {
                      //  print(index.toString());
                      // })
                      CurrebBallButton(index, state.props[2].toString())
                      : GridButton("", () {
                          print(index.toString());
                        }));
                }),
          ));
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
