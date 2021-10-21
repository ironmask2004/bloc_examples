import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arrows_bloc/ballboard/arrows/arrows.dart';

class ArrowPage extends StatelessWidget {
  const ArrowPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArrowsBloc(),
      child: const ArrowView(),
    );
  }
}

class ArrowView extends StatelessWidget {
  const ArrowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Arrows')),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: ArrowText()),
              ),
              //  Actions(),
              ActionsArrows(),
            ],
          ),
        ],
      ),
    );
  }
}

class ArrowText extends StatelessWidget {
  const ArrowText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      context.select((ArrowsBloc bloc) => bloc.state.currentArrow),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class ActionsArrows extends StatelessWidget {
  const ActionsArrows({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArrowsBloc, ArrowsState>(
      buildWhen: (prev, state) {
        // print('Prev: $prev Next $state');
        return prev.runtimeType != state.runtimeType;
      },
      builder: (context, state) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () =>
                  context.read<ArrowsBloc>().add(const ArrowMovedUP()),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () =>
                    context.read<ArrowsBloc>().add(const ArrowMovedLift()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.center_focus_strong),
                shape: const RoundedRectangleBorder(),
                onPressed: () =>
                    context.read<ArrowsBloc>().add(const ArrowInitialized()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.arrow_forward),
                onPressed: () =>
                    context.read<ArrowsBloc>().add(const ArrowMovedRight()),
              ),
            ]),
            FloatingActionButton(
              child: const Icon(Icons.arrow_downward_rounded),
              onPressed: () =>
                  context.read<ArrowsBloc>().add(const ArrowMovedDown()),
            ),
          ],
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade500,
          ],
        ),
      ),
    );
  }
}
