import 'package:flutter/material.dart';
import 'package:reejal/screens/questions_screen.dart';
import 'package:reejal/screens/quiz_home_screen.dart';
import 'package:reejal/screens/results_screen.dart';

import 'models/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreenId = 'main-screen';
  List<String> selectedAnswers = [];

  void changeScreen() {
    setState(() {
      activeScreenId = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreenId = 'results_screen'; //Results_Screen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreenId == 'main-screen'
        ? Quiz_Home_Page(changeScreen: changeScreen)
        : Questions_Screen(
            onSelectAnswer: chooseAnswer,
          );

    if (activeScreenId == 'results_screen') {
      screenWidget = Results_Screen(
        chosenAnswer: selectedAnswers, onRestart: () {  }, chosenAnswers: [],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 233, 80, 38),
                  Color.fromARGB(255, 239, 130, 34)
                ],
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
