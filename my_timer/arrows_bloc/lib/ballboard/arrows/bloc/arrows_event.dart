part of 'arrows_bloc.dart';

@immutable
abstract class ArrowsEvent extends Equatable {
  const ArrowsEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ArrowInitialized extends ArrowsEvent {
  const ArrowInitialized();
}

class ArrowMovedUP extends ArrowsEvent {
  const ArrowMovedUP();
}

class ArrowMovedDown extends ArrowsEvent {
  const ArrowMovedDown();
}

class ArrowMovedLift extends ArrowsEvent {
  const ArrowMovedLift();
}

class ArrowMovedRight extends ArrowsEvent {
  const ArrowMovedRight();
}
