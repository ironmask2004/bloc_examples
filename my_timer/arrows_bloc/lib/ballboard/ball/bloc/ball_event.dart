part of 'ball_bloc.dart';

@immutable
abstract class BallEvent extends Equatable {
  const BallEvent();

  @override
  List<Object> get props => [];
}

class BallStarted extends BallEvent {
  const BallStarted({required this.x, required this.y});
  final int x;
  final int y;
  final String direction = '+';
}

class BallPaused extends BallEvent {
  const BallPaused();
}

class BallResumed extends BallEvent {
  const BallResumed();
}

/*
class BallRunInProgress extends BallEvent {
  const BallRunInProgress();
}
*/
class BallReset extends BallEvent {
  const BallReset();
}

class BallDirChanged extends BallEvent {
  final String newDirection;

  const BallDirChanged(this.newDirection);
}

class BallTicked extends BallEvent {
  final int duration;

  const BallTicked({required this.duration});

  @override
  List<Object> get props => [duration];
}
