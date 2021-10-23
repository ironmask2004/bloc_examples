import 'package:arrows_bloc/ballboard/arrows/arrows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arrows_bloc/ballboard/ball/ball.dart';
import 'package:arrows_bloc/core/ticker.dart';

/* class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BallBloc(ticker: TimeTicker()),
      child: const ViewBall(),
    );
  }
}
*/
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ballText(),
            FloatingActionButton(
              child: const Icon(Icons.run_circle),
              onPressed: () =>
                  context.read<BallBloc>().add(const BallStarted(x: 0, y: 0)),
            ),
            FloatingActionButton(
                child: const Icon(Icons.pause_circle),
                onPressed: () {
                  context.read<BallBloc>().add(const BallPaused());
                }),
          ],
        );
      },
    );
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
