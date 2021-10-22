part of 'arrows_bloc.dart';

@immutable
abstract class ArrowsEvent extends Equatable {
  const ArrowsEvent() : super();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ArrowInitialized extends ArrowsEvent {
  const ArrowInitialized() : super();
}

class ArrowMovedUP extends ArrowsEvent {
  const ArrowMovedUP() : super();
}

class ArrowMovedDown extends ArrowsEvent {
  const ArrowMovedDown() : super();
}

class ArrowMovedLift extends ArrowsEvent {
  const ArrowMovedLift() : super();
}

class ArrowMovedRight extends ArrowsEvent {
  const ArrowMovedRight() : super();
}

class ArrowsChangedTo extends ArrowsEvent {
  final String currentArrow;
  const ArrowsChangedTo(this.currentArrow) : super();
}
