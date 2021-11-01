//import 'package:arrows_bloc/ballboard/arrows/arrows.dart';
import 'package:arrows_bloc/ballboard/board/bloc/worm_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arrows_bloc/ballboard/ball/ball.dart';
//import 'package:arrows_bloc/core/ticker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewBall extends StatelessWidget {
  const ViewBall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BallBloc, BallState>(
      buildWhen: (prev, state) {
        print('Prev: $prev Next $state');
        return prev.runtimeType != state.runtimeType;
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ballText(),
            BallAddTailFloatingAction(context),
            BallFloatingAction(context),

            BallRemoveTailFloatingAction(context),
          ],
        );
      },
    );
  }

  FloatingActionButton BallFloatingAction(BuildContext context) {
    final _ballState = context.select((BallBloc bloc) => bloc.state);

    if (_ballState is! BallRunInProgress) {
      return FloatingActionButton(
        child: const Icon(Icons.run_circle),
        onPressed: () =>
            context.read<BallBloc>().add(const BallStarted(x: 0, y: 0)),
      );
    } else {
      return FloatingActionButton(
          child: const Icon(Icons.pause_circle),
          onPressed: () => context.read<BallBloc>().add(const BallPaused()));
    }
  }
}

FloatingActionButton BallAddTailFloatingAction(BuildContext context) {
  final _ballState = context.select((BallBloc bloc) => bloc.state);

  if (_ballState is BallRunInProgress) {
    return FloatingActionButton(
        child: const Icon(FontAwesomeIcons.angleDoubleUp
            // size: 50,
            ),
        onPressed: () => context.read<WormBloc>().add(const WormtailAdded()));
  } else {
    return FloatingActionButton(
        child: const Icon(
          FontAwesomeIcons.angleDoubleUp,
          //  size: 50,
        ),
        onPressed: null);
  }
}

FloatingActionButton BallRemoveTailFloatingAction(BuildContext context) {
  final _ballState = context.select((BallBloc bloc) => bloc.state);

  if (_ballState is BallRunInProgress) {
    return FloatingActionButton(
        child: const Icon(FontAwesomeIcons.angleDoubleDown
            // size: 50,
            ),
        onPressed: () => context.read<WormBloc>().add(const Wormtailremoved()));
  } else {
    return FloatingActionButton(
        child: const Icon(
          FontAwesomeIcons.angleDoubleDown,
          //  size: 50,
        ),
        onPressed: null);
  }
}

class ballText extends StatelessWidget {
  const ballText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      context.select((BallBloc bloc) => bloc.state.props.toString()),
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
