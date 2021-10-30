import 'package:flutter/material.dart';
import 'package:test_card_form1/card/view/card_view.dart';

class CardPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CardPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CardForm(),
      ),
    );
  }
}
