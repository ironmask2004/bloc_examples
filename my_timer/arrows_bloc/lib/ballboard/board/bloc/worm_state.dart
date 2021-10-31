part of 'worm_bloc.dart';

@immutable
abstract class WormState extends Equatable {
  final List<int> wormCanvas;
  final Worm worm;
  static const int maxX = 9;

  const WormState(this.wormCanvas, this.worm);

  @override
  List<Object> get props => [wormCanvas, worm];
}

class WormInitial extends WormState {
  const WormInitial(List<int> wormCanvas, Worm worm) : super(wormCanvas, worm);

  @override
  String toString() => 'WormInitial';
}

class WormRunPause extends WormState {
  const WormRunPause(List<int> wormCanvas, Worm worm) : super(wormCanvas, worm);

  @override
  String toString() => 'WormRunPause';
}

class WormRunInProgress extends WormState {
  const WormRunInProgress(List<int> wormCanvas, Worm worm)
      : super(wormCanvas, worm);
  @override
  String toString() => 'WormRunInProgress';
}

class WormRunChangeDir extends WormState {
  const WormRunChangeDir(List<int> wormCanvas, Worm worm)
      : super(wormCanvas, worm);

  @override
  String toString() => 'WormRunChangeDir';
}

class WormRunComplete extends WormState {
  const WormRunComplete(List<int> wormCanvas, Worm worm)
      : super(wormCanvas, worm);
}

class WormTailAdd extends WormState {
  const WormTailAdd(List<int> wormCanvas, Worm worm) : super(wormCanvas, worm);
  @override
  String toString() => 'WormRunInProgress';
}
