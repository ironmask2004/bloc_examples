part of 'worm_bloc.dart';

@immutable
abstract class WormEvent extends Equatable {
  const WormEvent();

  @override
  List<Object> get props => [];
}

class WormStarted extends WormEvent {
  const WormStarted();
}

class WormPaused extends WormEvent {
  const WormPaused();
}

class WormResumed extends WormEvent {
  const WormResumed();
}

class WormReset extends WormEvent {
  const WormReset();
}

class WormDirChanged extends WormEvent {
  final String newDirection;

  const WormDirChanged(this.newDirection);
}

class WormtailAdded extends WormEvent {
  const WormtailAdded();
}

class Wormtailremoved extends WormEvent {
  const Wormtailremoved();
}

class WormMoved extends WormEvent {
  const WormMoved();
}

class WormTicked extends WormEvent {
  final String state1;
  const WormTicked(this.state1);
}
