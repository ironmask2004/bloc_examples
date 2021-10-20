part of 'ticker_bloc.dart';

@immutable
abstract class TickerEvent extends Equatable {
  /// {@macro ticker_event}
  const TickerEvent();

  @override
  List<Object> get props => [];
}

class TickerStarted extends TickerEvent {
  /// {@macro ticker_started}
  const TickerStarted();
}

class _TickerTicked extends TickerEvent {
  const _TickerTicked(this.tick);

  /// The current tick count.
  final int tick;

  @override
  List<Object> get props => [tick];
}
