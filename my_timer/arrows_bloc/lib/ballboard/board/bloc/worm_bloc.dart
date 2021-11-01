// ignore_for_file: unnecessary_this

import 'package:arrows_bloc/ballboard/ball/ball.dart';
import 'package:arrows_bloc/ballboard/board/model/worm.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
part 'worm_event.dart';
part 'worm_state.dart';

class WormBloc extends Bloc<WormEvent, WormState> {
  List<int> _wormCanvas = List<int>.filled(100, 0, growable: true); // [0, 0, 0]

  Worm _worm = Worm(Point(0, 0, '+', 0));

  final BallBloc _ballBloc;

  static const int _maxY = 9;
  static const int _maxX = 9;

  StreamSubscription<BallState>? _ballSubscription;

  WormBloc({
    required BallBloc ballBloc,
  })  : _ballBloc = ballBloc,
        super(WormInitial(List<int>.filled(100, 0, growable: true),
            Worm(const Point(0, 0, '+', 0)))) {
    _ballSubscription?.cancel();
    _ballSubscription = _ballBloc.stream.listen((state) {
      print('listend to newstate ' + state.toString());
      switch (state.toString()) {
        case "BallRunChangeDir":
          add(WormDirChanged(state.direction));
          break;
        default:
          add(WormTicked(state.toString()));
          break;
      }
    });

    on<WormTicked>((event, emit) {
      print('Worm  -------------->  Ticked !!!!');
      print(state.toString());
      add(WormMoved());
      emit(WormTick(state.wormCanvas, state.worm));
    });

    on<WormStarted>((event, emit) {
      print('Worm Started!!!!');

      emit(WormRunInProgress(state.wormCanvas, state.worm));
    });

    on<WormPaused>((event, emit) {
      if (state is WormRunInProgress) {
        emit(WormRunPause(state.wormCanvas, state.worm));
      }
    });

    on<WormDirChanged>((event, emit) {
      print('|||||||||||||status while change direction :' + state.toString());
      _worm.wormChangeDirection(event.newDirection);
      emit(WormRunChangeDir(_wormCanvas, _worm));
    });

    on<WormResumed>((event, emit) {
      if (state is WormRunPause) {
        emit(WormRunInProgress(_wormCanvas, _worm));
      }
    });

    on<WormReset>((event, emit) {
      emit(WormInitial(List<int>.filled(100, 0, growable: true),
          Worm(const Point(0, 0, '+', 0))));
    });

    on<WormMoved>((event, emit) {
      print('Worm Moved');

      Point _wormHead = state.worm.balls[0].copyWith();
      int _x = _wormHead.x, _y = _wormHead.y;
      print("before" + state.worm.balls.toString());
      print('----------ball moved --------=====');
      switch (_wormHead.direction) {
        case 'UP':
          {
            print('=UP=');
            _y = (_wormHead.y <= 0) ? _maxY : _wormHead.y - 1;
            break;
          }
        case 'DN':
          {
            _y = (_wormHead.y >= _maxY) ? 0 : _wormHead.y + 1;
            break;
          }
        case 'LF':
          {
            _x = (_wormHead.x <= 0) ? _maxX : _wormHead.x - 1;
            break;
          }
        case 'RT':
          {
            _x = (_wormHead.x >= _maxX) ? 0 : _wormHead.x + 1;
            break;
          }
        case '+':
          {
            print('+');
            //
            break;
          }
      }
      _worm.balls
          .insert(0, Point(_x, _y, _wormHead.direction, _worm.balls.length));
      _worm.balls.removeLast();

      _worm.balls.asMap().forEach((index, valuee) {
        _worm.balls[index] = valuee.copyWith(index: index);
      });
      print("after" + _worm.balls.toString());

      emit(WormRunInProgress(_wormCanvas, _worm));
    });

    on<WormtailAdded>((event, emit) {
      Point _wormLast =
          state.worm.balls[state.worm.balls.length - 1].copyWith();

      int _x = _wormLast.x, _y = _wormLast.y;

      print('----------ball Add taile --------=====');
      switch (_wormLast.direction) {
        case 'UP':
          {
            print('=UP=');

            _y = (_wormLast.y > _maxY) ? 0 : _wormLast.y + 1;
            break;
          }
        case 'DN':
          {
            _y = (_wormLast.y == 0) ? _maxY : _wormLast.y - 1;
            break;
          }
        case 'LF':
          {
            _x = (_wormLast.x > _maxX) ? 0 : _wormLast.x + 1;
            break;
          }
        case 'RT':
          {
            _x = (_wormLast.x == 0) ? _maxX : _wormLast.x - 1;
            break;
          }
        case '+':
          {
            print('+');

            break;
          }
      }
      _worm.balls.add(Point(_x, _y, _wormLast.direction, _worm.balls.length));
      print(_worm.balls.toString());
      emit(WormRunInProgress(_wormCanvas, _worm));
    });

    on<Wormtailremoved>((event, emit) {
      if (_worm.balls.length > 1) {
        _worm.balls.removeLast();
        print(_worm.balls.toString());
        emit(WormRunInProgress(_wormCanvas, _worm));
      }
    });
  }
  @override
  Future<void> close() {
    _ballSubscription?.cancel();
    return super.close();
  }
}
