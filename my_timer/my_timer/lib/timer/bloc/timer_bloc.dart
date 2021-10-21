import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:my_timer/core/ticker.dart';
import 'dart:async';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 3;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration)) {
    on<TimerStarted>
    
    ((event, emit) 
    {
      emit(TimerRunInProgress(event.duration));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(TimerTicked(duration: duration)));
    }
    )
    
    ;

    on<TimerPaused>((event, emit) {
      if (state is TimerRunInProgress) {
        _tickerSubscription?.pause();
        emit(TimerRunPause(state.duration));
      }
    });

    on<TimerResumed>(_onResumed);

    on<TimerReset>((event, emit) {
      _tickerSubscription?.cancel();
      emit(TimerInitial(_duration));
    });

    on<TimerTicked>((event, emit) {
      emit(
        event.duration > 0
            ? TimerRunInProgress(event.duration)
            : TimerRunComplete(),
      );
    });
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(state.duration));
    }
  }
}
