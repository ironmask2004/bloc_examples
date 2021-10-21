import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'arrows_event.dart';
part 'arrows_state.dart';

class ArrowsBloc extends Bloc<ArrowsEvent, ArrowsState> {
  ArrowsBloc() : super(const ArrowsInitial()) {
    on<ArrowInitialized>((event, emit) {
      if (state is! ArrowsInitial) emit(const ArrowsInitial());
    });
    on<ArrowMovedUP>((event, emit) {
      if (state is! ArrowsUP) emit(const ArrowsUP());
    });
    on<ArrowMovedDown>((event, emit) {
      if (state is! ArrowsDOWN) emit(const ArrowsDOWN());
    });
    on<ArrowMovedRight>((event, emit) {
      if (state is! ArrowsRIGHT) emit(const ArrowsRIGHT());
    });
    on<ArrowMovedLift>((event, emit) {
      if (state is! ArrowsLEFT) emit(const ArrowsLEFT());
    });
  }
}
