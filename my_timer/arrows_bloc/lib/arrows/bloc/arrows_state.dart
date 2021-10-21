part of 'arrows_bloc.dart';

@immutable
abstract class ArrowsState extends Equatable {
  final String currentArrow;

  const ArrowsState(this.currentArrow);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ArrowsInitial extends ArrowsState {
  const ArrowsInitial() : super('+');

  @override
  String toString() => 'Current Arrow is : + ';
}

class ArrowsUP extends ArrowsState {
  const ArrowsUP() : super('UP');

  @override
  String toString() => 'Current Arrow is : UP ';
}

class ArrowsDOWN extends ArrowsState {
  const ArrowsDOWN() : super('DN');

  @override
  String toString() => 'Current Arrow is : DWN ';
}

class ArrowsLEFT extends ArrowsState {
  const ArrowsLEFT() : super('LF');

  @override
  String toString() => 'Current Arrow is : LF ';
}

class ArrowsRIGHT extends ArrowsState {
  const ArrowsRIGHT() : super('RT');

  @override
  String toString() => 'Current Arrow is : RT ';
}
