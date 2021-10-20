import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ticker_bloc/core/ticker.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'ticker_event.dart';
part 'ticker_state.dart';

/* class TickerBloc extends Bloc<TickerEvent, TickerState> {
  TickerBloc() : super(TickerInitial()) {
    on<TickerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
*/

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  /// {@macro ticker_bloc}
  TickerBloc(Ticker ticker) : super(TickerInitial()) {
    on<TickerStarted>(
      (event, emit) async {
        await emit.onEach<int>(
          ticker.tick(),
          onData: (tick) => add(_TickerTicked(tick)),
        );
        emit(const TickerComplete());
      },
      transformer: restartable(),
    );

    on<_TickerTicked>((event, emit) => emit(TickerTickSuccess(event.tick)));
  }
}
