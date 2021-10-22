import 'dart:html';

import 'package:arrows_bloc/ballboard/arrows/bloc/arrows_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:arrows_bloc/core/ticker.dart';
import 'dart:async';
part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  final TimeTicker _ticker;
  final ArrowsBloc _arrowsBloc;
  static const int _duration = 1;
  int _x = 0;
  int _y = 0;
  int _maxY = 10;
  int _maxX = 10;
  String _direction = '+';

  StreamSubscription<int>? _tickerSubscription;

  StreamSubscription<ArrowsState>? _arrowsSubscription;

  BallBloc({required TimeTicker ticker, required ArrowsBloc arrowsBloc})
      : _ticker = ticker,
        _arrowsBloc = arrowsBloc,
        super(const BallInitial(0, 0)) {
    _arrowsSubscription?.cancel();
    _arrowsSubscription = _arrowsBloc.stream
        .listen((state) => add(BallDirChanged(state.currentArrow)));

    on<BallStarted>((event, emit) {
      print('Ball Started!!!!');

      emit(BallRunInProgress(_x, _y, _direction));
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
      _direction = event.newDirection;
      emit(BallRunChangeDir(_x, _y, _direction));
    });

    on<BallResumed>(_onResumed);

    on<BallReset>((event, emit) {
      _tickerSubscription?.cancel();
      emit(BallInitial(0, 0));
    });

    on<BallTicked>((event, emit) {
      print('----------ball ticked --------=====');

      switch (state.direction) {
        case 'UP':
          {
            print('=UP=');

            _y = (state.y <= 1) ? _maxY : state.y - 1;

            emit(BallRunInProgress(_x, _y, state.direction));
            break;
          }
        case 'DN':
          {
            _y = (state.y >= _maxY) ? 1 : state.y + 1;
            emit(BallRunInProgress(_x, _y, state.direction));
            break;
          }
        case 'LF':
          {
            _x = (state.x <= 1) ? _maxX : state.x - 1;
            emit(BallRunInProgress(_x, _y, state.direction));
            break;
          }
        case 'RT':
          {
            _x = (state.x >= _maxX) ? 1 : state.x + 1;
            emit(BallRunInProgress(_x, _y, state.direction));
            break;
          }
        case '+':
          {
            print('+');
            emit(BallRunInProgress(0, 0, state.direction));
            break;
          }
      }
    });

    @override
    Future<void> close() {
      _tickerSubscription?.cancel();
      _arrowsSubscription?.cancel();
      return super.close();
    }
  }
  void _onResumed(BallResumed resume, Emitter<BallState> emit) {
    if (state is BallRunPause) {
      _tickerSubscription?.resume();
      emit(BallRunInProgress(state.x, state.y, state.direction));
    }
  }
}
