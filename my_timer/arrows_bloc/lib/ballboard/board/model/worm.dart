import 'package:equatable/equatable.dart';
import 'dart:math';

class Point extends Equatable {
  final int x;
  final int y;
  final String direction;
  final int index;

  const Point(this.x, this.y, this.direction, this.index);

  @override
  List<Object> get props => [x, y, direction, index];

  Point copyWith({int? x, int? y, String? direction, int? index}) {
    return Point(
      x ?? this.x,
      y ?? this.y,
      direction ?? this.direction,
      index ?? this.index,
    );
  }

  static List<Point> randomGreenRedPoint(List<Point> balls) {
    List<Point> freeList = [];
    List<Point> freeGreeRedList = [];
    int cy, cx, freeListLength;
    var rn;

    Point cp;

    for (int index = 0; index < 100; index++) {
      cx = index % 10;
      cy = index ~/ 10;
      cp = balls.firstWhere((a) => a.x == cx && a.y == cy,
          orElse: () => Point(cx, cy, "-", 0));
      if (cp.direction == "-") {
        print('Found Free Point :' + cp.toString());
        freeList.add(cp);
      }
    }

    rn = Random();
    freeListLength = freeList.length;
    freeGreeRedList
        .add(freeList[rn.nextInt(freeListLength)].copyWith(direction: "G"));
    freeGreeRedList
        .add(freeList[rn.nextInt(freeListLength)].copyWith(direction: "R"));

    print('freePoint is $freeGreeRedList selected');

    return freeGreeRedList;
  }
}

class Worm extends Equatable {
  List<Point> balls = []; //[Point(0, 0, '+')];
  List<Point> redGreenBalls = [];

  Worm(Point ball) {
    balls.add(ball);
    newRedGreenBalls();
    // print('-=-=-=-=-=-=-=-=-=-=' + redGreenBalls.toString());
    // newRedBalls();
    // print('-=-=-=-=-=-=-=-=-=-=' + redGreenBalls.toString());

    // newGreenBalls();
    // print('-=-=-=-=-=-=-=-=-=-=' + redGreenBalls.toString());
  }

  wormReset() {
    print('Worm Reset');
    balls = [];
    redGreenBalls = [];
  }

  newRedGreenBalls() {
    redGreenBalls = Point.randomGreenRedPoint(balls);
  }

  Point? newRedBalls() {
    redGreenBalls.removeLast();
    redGreenBalls.add(Point.randomGreenRedPoint(balls)[1]);
  }

  Point? newGreenBalls() {
    redGreenBalls.remove(redGreenBalls[0]);
    redGreenBalls.insert(0, Point.randomGreenRedPoint(balls)[0]);
    // redGreenBalls.add(Point.randomGreenRedPoint(balls)[1]);
  }

  @override
  List<Object> get props => [balls];

  wormMoveForward() {
    print('Movd Worm Forward');
  }

  wormChangeDirection(String _direction) {
    balls[0] = balls[0].copyWith(direction: _direction);

    print('Change  Worm $_direction');
  }

  wormAddTail(int num) {
    print('add tail with $num balls');
  }

  wormRemovTail(int num) {
    print('Worm REmove Tail $num balls');
  }
}
