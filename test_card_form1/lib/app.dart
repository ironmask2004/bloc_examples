import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:test_card_form1/card/view/card_view.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    //required this.authenticationRepository,
    // required this.userRepository,
  }) : super(key: key);

  //final AuthenticationRepository authenticationRepository;
  //final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CardForm(),
      ),
    ));
  }
}

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
