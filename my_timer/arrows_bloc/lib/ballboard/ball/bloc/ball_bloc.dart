import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:arrows_bloc/core/ticker.dart';
import 'dart:async';
part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  final Ticker _ticker;
  static const int _duration = 3;

  StreamSubscription<int>? _tickerSubscription;

  BallBloc({required Ticker ticker})
      : _ticker = ticker,
        super(BallInitial(0, 0)) {
    on<BallStarted>((event, emit) {
      emit(BallRunInProgress(event.x, event.y));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: 1)
          .listen((duration) => add(BallTicked(duration: 1)));
    });

    on<BallPaused>((event, emit) {
      if (state is BallRunInProgress) {
        _tickerSubscription?.pause();
        emit(BallRunPause(state.x, state.y));
      }
    });

    on<BallResumed>(_onResumed);

    on<BallReset>((event, emit) {
      _tickerSubscription?.cancel();
      emit(DirectionBallInitial(0, 0));
    });

    on<BallTicked>((event, emit) {
      emit(
        event.duration > 0
            ? BallRunInProgress(state.x, state.y)
            : BallRunComplete(),
      );
    });
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onResumed(BallResumed resume, Emitter<BallState> emit) {
    if (state is BallRunPause) {
      _tickerSubscription?.resume();
      emit(BallRunInProgress(state.x, state.y));
    }
  }
}
