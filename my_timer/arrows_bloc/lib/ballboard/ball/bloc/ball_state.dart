part of 'ball_bloc.dart';

@immutable
abstract class BallState extends Equatable {
  final int x;
  final int y;
  final int maxY = 10;
  final int maxX = 10;

  const BallState(this.x, this.y);

  @override
  List<Object> get props => [x, y];
}

class BallInitial extends BallState {
  const BallInitial(int x, int y) : super(0, 0);

  @override
  String toString() => 'BallInitial { Position: $x:$y }';
}

class BallRunPause extends BallState {
  const BallRunPause(int x, int y) : super(x, y);

  @override
  String toString() => 'BallRunPause { Position: $x:$y }';
}

class BallRunInProgress extends BallState {
  const BallRunInProgress(int x, int y) : super(x, y);

  @override
  String toString() => 'BallRunInProgress { Position: $x:$y }';
}

class BallRunComplete extends BallState {
  const BallRunComplete() : super(0, 0);
}
