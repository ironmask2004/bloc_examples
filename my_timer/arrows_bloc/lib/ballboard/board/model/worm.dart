import 'package:equatable/equatable.dart';

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
}

class Worm extends Equatable {
  List<Point> balls = []; //[Point(0, 0, '+')];

  Worm(Point ball) {
    balls.add(ball);
  }

  wormReset() {
    print('Worm Reset');
    balls = [];
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
