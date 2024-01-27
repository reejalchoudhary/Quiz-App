import 'package:flutter/material.dart';

class Quiz_Home_Page extends StatelessWidget {
  const Quiz_Home_Page({required this.changeScreen, super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(155, 255, 255, 255),
          ),
          SizedBox(
            height: 38.0,
          ),
          Text(
            "Let's Learn Flutter",
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          ),
          SizedBox(
            height: 38.0,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: changeScreen,
            icon: Icon(Icons.double_arrow),
            label: Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
