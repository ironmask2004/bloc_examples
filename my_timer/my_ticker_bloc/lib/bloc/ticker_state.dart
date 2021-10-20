part of 'ticker_bloc.dart';

@immutable
abstract class TickerState extends Equatable {
  /// {@macro ticker_state}
  const TickerState();

  @override
  List<Object> get props => [];
}

class TickerInitial extends TickerState {}

class TickerTickSuccess extends TickerState {
  /// {@macro ticker_tick_success}
  const TickerTickSuccess(this.count);

  /// The current tick count.
  final int count;

  @override
  List<Object> get props => [count];
}

class TickerComplete extends TickerState {
  /// {@macro ticker_complete}
  const TickerComplete();
}
