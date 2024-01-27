import 'package:flutter/material.dart';

class Answer_Button extends StatelessWidget {
  Answer_Button({required this.answerText, required this.onTap, super.key});

  String answerText;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(answerText),
    );
  }
}
