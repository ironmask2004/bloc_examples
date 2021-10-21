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
  final String Direction = '+';
}

class BallPaused extends BallEvent {
  const BallPaused();
}

class BallResumed extends BallEvent {
  const BallResumed();
}

class BallReset extends BallEvent {
  const BallReset();
}

class BallTicked extends BallEvent {
  final int duration;
  const BallTicked({required this.duration});

  @override
  List<Object> get props => [duration];
}
