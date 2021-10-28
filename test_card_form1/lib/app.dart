
 import 'package:flutter/material.dart';
  
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
    return 
         AppView()
     
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
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            print(child.toString());
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                print(child.toString());
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                print(child.toString());
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
