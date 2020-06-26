import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  const ButtonText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.button,
    );
  }
}
