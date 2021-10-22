part of 'ball_bloc.dart';

@immutable
abstract class BallState extends Equatable {
  final int x;
  final int y;
  final int maxY = 10;
  final int maxX = 10;
  final String direction;

  const BallState(this.x, this.y, this.direction);

  @override
  List<Object> get props => [x, y, direction];
}

class BallInitial extends BallState {
  const BallInitial(int x, int y) : super(0, 0, '+');

  @override
  String toString() => 'BallInitial { Position: $x:$y - $direction }';
}

class BallRunPause extends BallState {
  const BallRunPause(int x, int y, String direction) : super(x, y, direction);

  @override
  String toString() => 'BallRunPause  { Position: $x:$y - $direction }';
}

class BallRunInProgress extends BallState {
  const BallRunInProgress(int x, int y, String direction)
      : super(x, y, direction);

  @override
  String toString() => 'BallRunInProgress  { Position: $x:$y - $direction }';
}

class BallRunChangeDir extends BallState {
  const BallRunChangeDir(int x, int y, String direction)
      : super(x, y, direction);

  @override
  String toString() => 'BallRunChangeDir  { Position: $x:$y - $direction }';
}

class BallRunComplete extends BallState {
  const BallRunComplete() : super(0, 0, '+');
}
