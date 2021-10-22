import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:arrows_bloc/core/ticker.dart';
import 'dart:async';
part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  final TimeTicker _ticker;
  static const int _duration = 1;
  String _direction = '+';

  StreamSubscription<int>? _tickerSubscription;

  BallBloc({required TimeTicker ticker})
      : _ticker = ticker,
        super(BallInitial(0, 0)) {
    on<BallStarted>((event, emit) {
      emit(BallRunInProgress(event.x, event.y, event.direction));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick()
          .listen((duration) => add(BallTicked(duration: duration)));
    });

    on<BallPaused>((event, emit) {
      if (state is BallRunInProgress) {
        _tickerSubscription?.pause();
        emit(BallRunPause(state.x, state.y, state.direction));
      }
    });

    on<BallDirChanged>((event, emit) {
      print('BALLL CHANGED DIRE : $state.direction');
      emit(BallDirChanged(state.x, state.y, state.direction));
      //emit(BallRunInProgress(state.x, state.y, _direction));
    });

    on<BallResumed>(_onResumed);

    on<BallReset>((event, emit) {
      _tickerSubscription?.cancel();
      emit(BallInitial(0, 0));
    });

    on<BallTicked>((event, emit) {
      print(event.duration);

      if (event.duration <= 0) {
        emit(BallRunComplete());
      } else {
        switch (state.direction) {
          case 'UP':
            {
              print('UP');
              emit(BallRunInProgress(state.x, state.y - 1, state.direction));
              break;
            }
          case 'DN':
            {
              emit(BallRunInProgress(state.x, state.y + 1, state.direction));
              break;
            }
          case 'LF':
            {
              emit(BallRunInProgress(state.x - 1, state.y, state.direction));
              break;
            }
          case 'RT':
            {
              emit(BallRunInProgress(state.x + 1, state.y, state.direction));
              break;
            }
          case '+':
            {
              print('+');
              emit(BallRunInProgress(0, 0, state.direction));
              break;
            }
        }
      }
    });

    @override
    Future<void> close() {
      _tickerSubscription?.cancel();
      return super.close();
    }
  }
  void _onResumed(BallResumed resume, Emitter<BallState> emit) {
    if (state is BallRunPause) {
      _tickerSubscription?.resume();
      print(state.direction);
      emit(BallRunInProgress(state.x, state.y, state.direction));
    }
  }
}
